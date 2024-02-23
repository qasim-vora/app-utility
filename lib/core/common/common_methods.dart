import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core_app/l10n/localization.dart';
import 'package:core_app/utils/extensions.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/language/localization_bloc.dart';
import '../../features/theme/theme_bloc.dart';
import '../../utils/logger_util.dart';
import '../styles/font_constants.dart';
import '../widgets/common_outlined_button.dart';
import '../widgets/common_text.dart';
import 'common_widgets.dart';

class CommonMethods {
  static String emailRegExp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String nameRegExp = r'^.{2,70}$';

  hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static String getPlatformDevice() {
    String platform = "";
    if (Platform.isAndroid) {
      platform = "";
    } else if (Platform.isIOS) {
      platform = "";
    }

    return platform;
  }

  static Future<String> getPlatformVersion() async {
    String version = "1.0.0";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = Platform.isAndroid ? packageInfo.version : packageInfo.version;
    return version;
  }

  static Future<String> getDeviceInfo() async {
    String appDevice = "";
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo =
          await DeviceInfoPlugin().androidInfo;
      appDevice = androidDeviceInfo.model;
      logger.e("DEVICE INFO --$androidDeviceInfo");
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      appDevice = iosDeviceInfo.name;
    }

    return appDevice;
  }

  static Future<int> getAndroidVersion() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo =
          await DeviceInfoPlugin().androidInfo;
      logger.log(
        "androidDeviceInfo.version.sdkInt: ${androidDeviceInfo.version.sdkInt}",
      );
      return androidDeviceInfo.version.sdkInt;
    } else {
      return 0;
    }
  }

  static String getBase64FromFile(String fileName) {
    final bytes = File(fileName).readAsBytesSync();

    String img64 = base64Encode(bytes);
    return img64;
  }

  static String getConvertedDate(
      {String? inputDateFormat, String? outputDateFormat, String? date}) {
    if (date == null || date.isEmpty) {
      return "";
    }
    try {
      var dateFormat = DateFormat(outputDateFormat)
          .format(DateFormat(inputDateFormat).parse(date));
      return dateFormat;
    } catch (exception) {
      return "";
    }
  }

  /// get country flag
  static String getCountryFlag({
    required String countryCode,
  }) {
    return "assets/flags/${countryCode.toLowerCase()}.png";
  }

  static String durationToString(int duration) {
    final int hour = duration ~/ 60;
    final int minutes = duration % 60;
    if (hour > 0) {
      return '${hour.toString()}h ${minutes.toString()}m';
    } else {
      return '${minutes.toString()}m';
    }
  }

  static Future<void> openLink({
    String urlPath = "",
    String urlScheme = "",
  }) async {
    Uri url;
    if (urlScheme != "") {
      url = Uri(scheme: urlScheme, path: urlPath);
    } else {
      if (urlPath.startsWith("http")) {
        url = Uri.parse(urlPath);
      } else {
        url = Uri.https(urlPath);
      }
    }

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // todo: handle when can't open url
      }
    } catch (e) {
      logger.e("ERROR open link: $e");
    }
  }

  static Future<bool> askPermission({
    Permission? permission,
    String? whichPermission,
  }) async {
    bool isPermissionGranted = await permission!.isGranted;
    var shouldShowRequestRationale =
        await permission.shouldShowRequestRationale;

    if (isPermissionGranted) {
      return true;
    } else {
      if (!shouldShowRequestRationale) {
        var permissionStatus = await permission.request();
        logger.e("STATUS == $permissionStatus");
        if (permissionStatus.isPermanentlyDenied) {
          // todo: show dialog of open setting
          return false;
        }
        if (permissionStatus.isGranted || permissionStatus.isLimited) {
          return true;
        } else {
          return false;
        }
      } else {
        var permissionStatus = await permission.request();
        if (permissionStatus.isGranted || permissionStatus.isLimited) {
          return true;
        } else {
          return false;
        }
      }
    }
  }

  static Future<Permission?> getGalleryPermission() async {
    if (Platform.isAndroid && await CommonMethods.getAndroidVersion() < 33) {
      return Permission.storage;
    } else {
      return Permission.photos;
    }
  }

  static Future<bool> imageSize(XFile file) async {
    final bytes = (await file.readAsBytes()).lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;

    logger.e("IMAGE SIZE ----$mb");

    if (mb <= 15) {
      return true;
    } else {
      return false;
    }
  }

  /// date format
  static String getFormattedDate({
    DateTime? date,
    String dateFormat = "d MMM y", //
  }) {
    if (date == null) {
      return "";
    } else {
      return DateFormat(dateFormat).format(date);
    }
  }


  static Future<bool> askLocationPermission({
    String? whichPermission,
    BuildContext? context,
  }) async {
    LocationPermission permission = await Geolocator.checkPermission();
    bool isPermissionGranted = permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;

    if (isPermissionGranted) {
      return true;
    } else {
      LocationPermission permissionStatus =
          await Geolocator.requestPermission();
      logger.e("STATUS == $permissionStatus");
      if (permissionStatus == LocationPermission.deniedForever) {
        CommonWidgets.showCustomDialog(
            context,
            context!.translate.permissionTxt,
            "${context?.translate.pleaseAllowThe} $whichPermission ${context?.translate.permissionFromSettings}",
            context!.translate.cancel,
            context.translate.settings, (value) {
          /// OPEN SETTING CODE
          if (value == 1) {
            openAppSettings();
          }
        });
        return false;
      }
      if (permissionStatus == LocationPermission.always ||
          permissionStatus == LocationPermission.whileInUse) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<bool> getCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      openAppSettings();
      return false;
    }

    bool isPermissionGranted = await askLocationPermission(
      whichPermission: "Location",
    );
    logger.i("LOCATION PERMISSION: $isPermissionGranted}");
    return isPermissionGranted;
  }

  static bool isDark() {
    return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
        ? true
        : false;
  }

  static void showThemePanel({required BuildContext context}) {
    context.read<ThemeBloc>().add(const ThemeEvent.started());
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Wrap(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            const Spacer(
                              flex: 1,
                            ),
                            CommonText(
                              text: "Select Theme",
                              fontFamily: FontFamilyConstants.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: FontConstants.font_22,
                            ),
                            const Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: state.group,
                                onChanged: (int? value) {
                                  context.read<ThemeBloc>().add(
                                      ThemeEvent.radioChange(index: value!));
                                }),
                            CommonText(
                              text: context.translate.lightTheme,
                              fontFamily: FontFamilyConstants.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: FontConstants.font_18,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: state.group,
                                onChanged: (int? value) {
                                  context.read<ThemeBloc>().add(
                                      ThemeEvent.radioChange(index: value!));
                                }),
                            CommonText(
                              text: context.translate.darkTheme,
                              fontFamily: FontFamilyConstants.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: FontConstants.font_18,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 3,
                                groupValue: state.group,
                                onChanged: (int? value) {
                                  context.read<ThemeBloc>().add(
                                      ThemeEvent.radioChange(index: value!));
                                }),
                            CommonText(
                              text: context.translate.defaultTheme,
                              fontFamily: FontFamilyConstants.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: FontConstants.font_18,
                            )
                          ],
                        ),
                        CommonButton(
                          onPressed: () {
                            context
                                .read<ThemeBloc>()
                                .add(const ThemeEvent.themeChange());
                            Navigator.pop(context);
                          },
                          buttonText: context.translate.changeTheme,
                        ).paddingSymmetric(vertical: 32.h, horizontal: 16.w),
                      ],
                    ))
              ],
            );
          },
        );
      },
    );
  }

  static showLanguagePanel({required BuildContext screenContext}) {
    screenContext
        .read<LocalizationBloc>()
        .add(const LocalizationEvent.getLocale());
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: screenContext,
      builder: (BuildContext context) {
        return BlocConsumer<LocalizationBloc, LocalizationState>(
          builder: (context, state) {
            return Wrap(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            const Spacer(
                              flex: 1,
                            ),
                            CommonText(
                              text: "Select Language",
                              fontFamily: FontFamilyConstants.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: FontConstants.font_22,
                            ),
                            const Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "en",
                                //  value: "en-US" ,
                                groupValue: state.langCode,
                                onChanged: (String? value) {
                                  context.read<LocalizationBloc>().add(
                                      LocalizationEvent.radioChange(
                                          value: value!));
                                }),
                            CommonText(
                              text: context.translate.english,
                              fontFamily: FontFamilyConstants.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: FontConstants.font_18,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "es",
                                // value: "es-ES" ,
                                groupValue: state.langCode,
                                onChanged: (String? value) {
                                  context.read<LocalizationBloc>().add(
                                      LocalizationEvent.radioChange(
                                          value: value!));
                                }),
                            CommonText(
                              text: context.translate.spanish,
                              fontFamily: FontFamilyConstants.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: FontConstants.font_18,
                            )
                          ],
                        ),
                        CommonButton(
                          onPressed: () {
                            context
                                .read<LocalizationBloc>()
                                .add(const LocalizationEvent.changeLocale());
                            Navigator.pop(context);
                          },
                          buttonText: context.translate.changeLanguage,
                        ).paddingSymmetric(vertical: 32.h, horizontal: 16.w),
                      ],
                    ))
              ],
            );
          },
          listener: (BuildContext context, LocalizationState state) {},
        );
      },
    );
  }

  static Future<bool> checkLocationPermissionStatus() async {
    LocationPermission permission = await Geolocator.checkPermission();
    bool isPermissionGranted = permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
    return isPermissionGranted;
  }

  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // static Future<void> signInWithApple() async {
  //   final rawNonce = generateNonce();
  //   final nonce = sha256ofString(rawNonce);
  //
  //   // Request credential for the currently signed in Apple account.
  //   // final res = await SignInWithApple.getAppleIDCredential(
  //   //   scopes: [
  //   //     AppleIDAuthorizationScopes.email,
  //   //     AppleIDAuthorizationScopes.fullName,
  //   //   ],
  //   //    // intent://callback?${PARAMETERS FROM CALLBACK BODY}#Intent;package=YOUR.PACKAGE.IDENTIFIER;scheme=signinwithapple;end
  //   //     webAuthenticationOptions: WebAuthenticationOptions(
  //   //         clientId: "com.taxi.driver1-service",
  //   //        redirectUri: Uri.parse("https://driver-8841b.firebaseapp.com/__/auth/handler"))
  //   //
  //   //   // nonce: nonce,
  //   // );
  //
  //   final appleProvider = AppleAuthProvider();
  //
  //   try {
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithProvider(appleProvider);
  //     print("userCredential --- ${userCredential.toString()}");
  //
  //     String? authCode = userCredential.additionalUserInfo?.authorizationCode;
  //     print("AUTH CODE -- $authCode");
  //   } on FirebaseAuthException catch (error) {
  //     print("error.code");
  //     print(error.code);
  //   }
  // }
}
