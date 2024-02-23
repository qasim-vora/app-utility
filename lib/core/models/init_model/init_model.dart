// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_model.freezed.dart';
part 'init_model.g.dart';

@freezed
class InitModel with _$InitModel {
  const factory InitModel({
    @JsonKey(name: "app_menu_link")
    @Default(<AppMenuLink>[])
    List<AppMenuLink> appMenuLink,
  }) = _InitModel;

  factory InitModel.fromJson(Map<String, dynamic> json) =>
      _$InitModelFromJson(json);
}

@freezed
class AppMenuLink with _$AppMenuLink {
  const factory AppMenuLink({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "show_name") @Default("") String showName,
    @JsonKey(name: "value") @Default("") String value,
  }) = _AppMenuLink;

  factory AppMenuLink.fromJson(Map<String, dynamic> json) =>
      _$AppMenuLinkFromJson(json);
}
