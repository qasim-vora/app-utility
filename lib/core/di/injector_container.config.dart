// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_app/core/deep_links/app_link_handel.dart' as _i3;
import 'package:core_app/core/services/api_service/dio_client.dart' as _i9;
import 'package:core_app/features/internet_connection/network_connectivity_bloc.dart'
    as _i7;
import 'package:core_app/features/language/localization_bloc.dart' as _i6;
import 'package:core_app/features/theme/theme_bloc.dart' as _i8;
import 'package:core_app/repository/local_data/local_data_source.dart' as _i4;
import 'package:core_app/repository/local_data/local_data_source_impl.dart'
    as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppLinks>(_i3.AppLinks());
  gh.lazySingleton<_i4.LocalDataSource>(() => _i5.LocalDataSourceImpl());
  gh.factory<_i6.LocalizationBloc>(
      () => _i6.LocalizationBloc(localDataSource: gh<_i4.LocalDataSource>()));
  gh.factory<_i7.NetworkConnectivityBloc>(() => _i7.NetworkConnectivityBloc());
  gh.factory<_i8.ThemeBloc>(
      () => _i8.ThemeBloc(localDataSource: gh<_i4.LocalDataSource>()));
  gh.lazySingleton<_i9.DioClient>(
      () => _i9.DioClient(localDataSource: gh<_i4.LocalDataSource>()));
  return getIt;
}
