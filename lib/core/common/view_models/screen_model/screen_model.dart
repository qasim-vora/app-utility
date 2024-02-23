import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_model.freezed.dart';

@freezed
class ScreenModel with _$ScreenModel {
  const factory ScreenModel({
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "path") required String path,
  }) = _ScreenModel;
}
