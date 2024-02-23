import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/common/app_constants/app_value_constants.dart';
import '../../core/common/app_constants/storage_key.dart';
import '../../features/language/localization_bloc.dart';
import '../../features/theme/theme_bloc.dart';
import 'local_data_source.dart';

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future setData(String key, value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (value is String) {
      return pref.setString(key, value);
    } else if (value is int) {
      return pref.setInt(key, value);
    } else if (value is double) {
      return pref.setDouble(key, value);
    } else if (value is bool) {
      return pref.setBool(key, value);
    } else {
      return pref.setString(key, value);
    }
  }

  @override
  Future getData(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(key);
  }

  @override
  Future clearSpecificKey(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }

  @override
  void clearData() {
    SharedPreferences.getInstance().then((value) {
      value.clear();
    });
  }

  @override
  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(StorageKeys.keyLoggedIn);
    pref.remove(StorageKeys.keyTheme);
    AppValueConstants.globalKey.currentContext?.read<ThemeBloc>().add(const ThemeEvent.radioChange(index: 1));
    AppValueConstants.globalKey.currentContext?.read<ThemeBloc>().add(const ThemeEvent.themeChange());
    pref.remove(StorageKeys.language);
    AppValueConstants.globalKey.currentContext?.read<LocalizationBloc>().add(const LocalizationEvent.radioChange(value: "en"));
    AppValueConstants.globalKey.currentContext?.read<LocalizationBloc>().add(const LocalizationEvent.changeLocale());
  }
}

// @LazySingleton(as: LocalDataSource)
// class LocalDataSourceImpl extends LocalDataSource {
//   @override
//   void clearData() {
//     final GetStorage box = GetStorage();
//     box.erase();
//   }
//
//   @override
//   Future clearSpecificKey(String key) async {
//     final GetStorage box = GetStorage();
//     return box.remove(key);
//   }
//
//   @override
//   Future getData(String key) async {
//     final GetStorage box = GetStorage();
//     return box.read(key);
//   }
//
//   @override
//   Future setData(String key, value) async {
//     final GetStorage box = GetStorage();
//     return box.write(key, value);
//   }
//   @override
//   Future logout() async {
//     final GetStorage box = GetStorage();
//        box.remove(StorageKeys.keyLoggedIn);
//        box.remove(StorageKeys.keyTheme);
//        AppValueConstants.globalKey.currentContext?.read<ThemeBloc>().add(const ThemeEvent.radioChange(index: 1));
//        AppValueConstants.globalKey.currentContext?.read<ThemeBloc>().add(const ThemeEvent.themeChange());
//        box.remove(StorageKeys.language);
//        AppValueConstants.globalKey.currentContext?.read<LocalizationBloc>().add(const LocalizationEvent.radioChange(value: "en"));
//        AppValueConstants.globalKey.currentContext?.read<LocalizationBloc>().add(const LocalizationEvent.changeLocale());
//        // box.remove(StorageKeys.isDocUploaded);
//        // box.remove(StorageKeys.isVehicleRegistered);
//   }
// }
