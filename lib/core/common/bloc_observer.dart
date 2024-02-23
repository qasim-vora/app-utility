import 'package:core_app/utils/navigation_extention.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/internet_connection/network_connectivity_bloc.dart';
import 'app_constants/app_value_constants.dart';
import 'common_widgets.dart';

class BlocTestObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('onCreate -- ${bloc.runtimeType}');
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (change.nextState is NetworkDisconnected) {
      print("INTERNET LOST");

      CommonWidgets.noInternetDialog(
        context: AppValueConstants.globalKey.currentContext!,
      );
    }

    if (change.currentState is NetworkDisconnected &&
        change.nextState is NetworkConnected) {
      AppValueConstants.globalKey.currentContext!.pop();
    }

    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
