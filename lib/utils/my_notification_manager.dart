import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../core/common/app_constants/storage_key.dart';
import '../core/di/injector_container.dart';
import '../repository/local_data/local_data_source.dart';
import 'logger_util.dart';

class MyNotificationManager {
  MyNotificationManager._();

  factory MyNotificationManager() => _instance;
  static final MyNotificationManager _instance = MyNotificationManager._();
  RemoteMessage? remoteMessage;
  NotificationSettings? settings;

  Future<void> init() async {
    _setFCMToken();
    _configure();
  }

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  /// Function to ask user for push notification permissions and if provided, save FCM Token in persisted local storage.
  void _setFCMToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    /// requesting permission for [alert], [badge] & [sound]. Only for iOS
    settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    /// saving token only if user granted access.
    if (settings!.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      await getIt<LocalDataSource>()
          .setData(StorageKeys.keyDeviceToken, token ?? "123456");
      logger.e('FirebaseMessaging token: $token');
    }
  }

  /// Function to configure the functionality of displaying and tapping on notifications.
  void _configure() async {
    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description: 'This channel is used for important notifications.',
        // description
        importance: Importance.high,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      var initializationSettingsAndroid =
          const AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettingsIOS = const DarwinInitializationSettings();
      var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
          logger.log(
              'A new flutterLocalNotificationsPlugin.initialize event was published!');
          logger.log(
              "Notification Is In flutterLocalNotificationsPlugin.initialize");
          logger.log(
              "flutterLocalNotificationsPlugin.initialize  :  ${remoteMessage?.data}");
          if (remoteMessage != null) {
            handleNotification(remoteMessage!, AppState.foreground);
          }
        },
      );

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable headzs up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    /// For iOS only, setting values to show the notification when the app is in foreground state.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    /// handler when notification arrives. This handler is executed only when notification arrives in foreground state.
    /// For iOS, OS handles the displaying of notification
    /// For Android, we push local notification
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        remoteMessage = message;
        RemoteNotification? notification = remoteMessage?.notification;
        AndroidNotification? android = remoteMessage?.notification?.android;
        AppleNotification? apple = remoteMessage?.notification?.apple;

        print(
            "Notification Is In onMessage remoteMessage == ${json.encode(remoteMessage!.data)}");
        print(
            "Notification Is In onMessage notification == ${remoteMessage!.notification?.toMap()}");

        if (remoteMessage?.data != null) {
          print("InOfTheIfCondition");
          print("InOfTheIfCondition : ${remoteMessage?.data}");

          if (Platform.isAndroid) {
            flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification?.title,
              notification?.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription: channel.description,
                  styleInformation: const BigTextStyleInformation(""),
                  // TODO add a proper drawable resource to android, for now using
                  //      one that already exists in example app.
                  // icon: 'ic_down',
                ),
                iOS: DarwinNotificationDetails(
                  presentAlert: true,
                  presentBadge: true,
                  subtitle: notification?.body,
                  // subtitle: remoteMessage?.data["body"],
                  presentSound: true,
                ),
              ),
            );
          }
        }

        /// when receive notification handle event
      },
    );

    /// handler when user taps on the notification.
    /// For iOS, it gets executed when the app is in [foreground] / [background] state.
    /// For Android, it gets executed when the app is in [background] state.
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        print("onMessageOpenedApp ${message.data}");
        print('A new onMessageOpenedApp event was published!');
        print("Notification Is In onMessageOpenedApp");

        handleNotification(message, AppState.foreground);
      },
    );

    /// If the app is launched from terminated state by tapping on a notification, [getInitialMessage] function will return the
    /// [RemoteMessage] only once.
    FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? message) {
        if (message != null) {
          print("Notification Is In getInitialMessage");
          handleNotification(message, AppState.terminated);
        }
      },
    );
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // you need to initialize firebase first

    print("Handling a background message: ${message.messageId}");
  }

  Future<void> handleNotification(
      RemoteMessage message, AppState appState) async {
    logger.log('handleNotification a background message ${message.messageId}');
    logger.log(
        'handleNotification a background message ${message.notification!}');
    logger.log('handleNotification a background message ${message.data}');

    if (Platform.isAndroid || Platform.isIOS) {
      Map<String, dynamic> notificationMessage = message.data;
      logger.log("notificationMessage:$notificationMessage",
          printFullText: true);

      Map<String, dynamic> notificationData = jsonDecode(message.data["data"]);
      logger.log("notificationData:$notificationData", printFullText: true);
      print("appState: $appState");

      if (appState == AppState.foreground || appState == AppState.background) {
        // TODO: - REDIRECTION FLOW FOR CLICK OF NOTIFICATION
        print("Notification Type: ${message.data["type"]}");
      } else if (appState == AppState.terminated) {
        /* notificationId = "notificationId";
        firebaseMessage = notificationMessage;*/
      }
    }
  }
}

enum AppState { foreground, background, terminated }
