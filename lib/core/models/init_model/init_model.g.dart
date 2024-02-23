// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InitModelImpl _$$InitModelImplFromJson(Map<String, dynamic> json) =>
    _$InitModelImpl(
      appMenuLink: (json['app_menu_link'] as List<dynamic>?)
              ?.map((e) => AppMenuLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AppMenuLink>[],
    );

Map<String, dynamic> _$$InitModelImplToJson(_$InitModelImpl instance) =>
    <String, dynamic>{
      'app_menu_link': instance.appMenuLink,
    };

_$AppMenuLinkImpl _$$AppMenuLinkImplFromJson(Map<String, dynamic> json) =>
    _$AppMenuLinkImpl(
      id: json['id'] as int? ?? 0,
      showName: json['show_name'] as String? ?? "",
      value: json['value'] as String? ?? "",
    );

Map<String, dynamic> _$$AppMenuLinkImplToJson(_$AppMenuLinkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'show_name': instance.showName,
      'value': instance.value,
    };
