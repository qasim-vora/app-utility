part of 'localization_bloc.dart';

@freezed
class LocalizationState with _$LocalizationState {
  const factory LocalizationState.initial({
    @Default(Locale("en")) Locale locale,
    @Default("en") String langCode,
    @Default(false) bool isChanged,
  }) = _Initial;
}
