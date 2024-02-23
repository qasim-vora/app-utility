import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../core/common/app_constants/storage_key.dart';
import '../../repository/local_data/local_data_source.dart';

part 'localization_bloc.freezed.dart';
part 'localization_event.dart';
part 'localization_state.dart';

@Injectable()
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalDataSource localDataSource;
  LocalizationBloc({required this.localDataSource})
      : super(const LocalizationState.initial()) {
    on<LocalizationEvent>(
      (event, emit) async {
        await event.when(
          changeLocale: () async {
            await localDataSource.setData(StorageKeys.language, state.langCode);
            emit(state.copyWith(
                locale: Locale(state.langCode),
                langCode: state.langCode,
                isChanged: true));
          },
          getLocale: () async {
            var lang = await localDataSource.getData(StorageKeys.language);
            if (lang != null && lang != "") {
              emit(state.copyWith(locale: Locale(lang), langCode: lang));
            } else {
              emit(state.copyWith(locale: const Locale("en"), langCode: 'en'));
            }
          },
          radioChange: (String value) {
            emit(
              state.copyWith(langCode: value),
            );
          },
          reset: () {
            emit(state.copyWith(isChanged: false));
          },
        );
      },
    );
  }
}
