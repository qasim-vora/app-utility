// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'init_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InitModel _$InitModelFromJson(Map<String, dynamic> json) {
  return _InitModel.fromJson(json);
}

/// @nodoc
mixin _$InitModel {
  @JsonKey(name: "app_menu_link")
  List<AppMenuLink> get appMenuLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InitModelCopyWith<InitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitModelCopyWith<$Res> {
  factory $InitModelCopyWith(InitModel value, $Res Function(InitModel) then) =
      _$InitModelCopyWithImpl<$Res, InitModel>;
  @useResult
  $Res call({@JsonKey(name: "app_menu_link") List<AppMenuLink> appMenuLink});
}

/// @nodoc
class _$InitModelCopyWithImpl<$Res, $Val extends InitModel>
    implements $InitModelCopyWith<$Res> {
  _$InitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appMenuLink = null,
  }) {
    return _then(_value.copyWith(
      appMenuLink: null == appMenuLink
          ? _value.appMenuLink
          : appMenuLink // ignore: cast_nullable_to_non_nullable
              as List<AppMenuLink>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitModelImplCopyWith<$Res>
    implements $InitModelCopyWith<$Res> {
  factory _$$InitModelImplCopyWith(
          _$InitModelImpl value, $Res Function(_$InitModelImpl) then) =
      __$$InitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "app_menu_link") List<AppMenuLink> appMenuLink});
}

/// @nodoc
class __$$InitModelImplCopyWithImpl<$Res>
    extends _$InitModelCopyWithImpl<$Res, _$InitModelImpl>
    implements _$$InitModelImplCopyWith<$Res> {
  __$$InitModelImplCopyWithImpl(
      _$InitModelImpl _value, $Res Function(_$InitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appMenuLink = null,
  }) {
    return _then(_$InitModelImpl(
      appMenuLink: null == appMenuLink
          ? _value._appMenuLink
          : appMenuLink // ignore: cast_nullable_to_non_nullable
              as List<AppMenuLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InitModelImpl implements _InitModel {
  const _$InitModelImpl(
      {@JsonKey(name: "app_menu_link")
      final List<AppMenuLink> appMenuLink = const <AppMenuLink>[]})
      : _appMenuLink = appMenuLink;

  factory _$InitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InitModelImplFromJson(json);

  final List<AppMenuLink> _appMenuLink;
  @override
  @JsonKey(name: "app_menu_link")
  List<AppMenuLink> get appMenuLink {
    if (_appMenuLink is EqualUnmodifiableListView) return _appMenuLink;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appMenuLink);
  }

  @override
  String toString() {
    return 'InitModel(appMenuLink: $appMenuLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitModelImpl &&
            const DeepCollectionEquality()
                .equals(other._appMenuLink, _appMenuLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_appMenuLink));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitModelImplCopyWith<_$InitModelImpl> get copyWith =>
      __$$InitModelImplCopyWithImpl<_$InitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InitModelImplToJson(
      this,
    );
  }
}

abstract class _InitModel implements InitModel {
  const factory _InitModel(
      {@JsonKey(name: "app_menu_link")
      final List<AppMenuLink> appMenuLink}) = _$InitModelImpl;

  factory _InitModel.fromJson(Map<String, dynamic> json) =
      _$InitModelImpl.fromJson;

  @override
  @JsonKey(name: "app_menu_link")
  List<AppMenuLink> get appMenuLink;
  @override
  @JsonKey(ignore: true)
  _$$InitModelImplCopyWith<_$InitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppMenuLink _$AppMenuLinkFromJson(Map<String, dynamic> json) {
  return _AppMenuLink.fromJson(json);
}

/// @nodoc
mixin _$AppMenuLink {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "show_name")
  String get showName => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppMenuLinkCopyWith<AppMenuLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppMenuLinkCopyWith<$Res> {
  factory $AppMenuLinkCopyWith(
          AppMenuLink value, $Res Function(AppMenuLink) then) =
      _$AppMenuLinkCopyWithImpl<$Res, AppMenuLink>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "show_name") String showName,
      @JsonKey(name: "value") String value});
}

/// @nodoc
class _$AppMenuLinkCopyWithImpl<$Res, $Val extends AppMenuLink>
    implements $AppMenuLinkCopyWith<$Res> {
  _$AppMenuLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? showName = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      showName: null == showName
          ? _value.showName
          : showName // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppMenuLinkImplCopyWith<$Res>
    implements $AppMenuLinkCopyWith<$Res> {
  factory _$$AppMenuLinkImplCopyWith(
          _$AppMenuLinkImpl value, $Res Function(_$AppMenuLinkImpl) then) =
      __$$AppMenuLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "show_name") String showName,
      @JsonKey(name: "value") String value});
}

/// @nodoc
class __$$AppMenuLinkImplCopyWithImpl<$Res>
    extends _$AppMenuLinkCopyWithImpl<$Res, _$AppMenuLinkImpl>
    implements _$$AppMenuLinkImplCopyWith<$Res> {
  __$$AppMenuLinkImplCopyWithImpl(
      _$AppMenuLinkImpl _value, $Res Function(_$AppMenuLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? showName = null,
    Object? value = null,
  }) {
    return _then(_$AppMenuLinkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      showName: null == showName
          ? _value.showName
          : showName // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppMenuLinkImpl implements _AppMenuLink {
  const _$AppMenuLinkImpl(
      {@JsonKey(name: "id") this.id = 0,
      @JsonKey(name: "show_name") this.showName = "",
      @JsonKey(name: "value") this.value = ""});

  factory _$AppMenuLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppMenuLinkImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "show_name")
  final String showName;
  @override
  @JsonKey(name: "value")
  final String value;

  @override
  String toString() {
    return 'AppMenuLink(id: $id, showName: $showName, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppMenuLinkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.showName, showName) ||
                other.showName == showName) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, showName, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppMenuLinkImplCopyWith<_$AppMenuLinkImpl> get copyWith =>
      __$$AppMenuLinkImplCopyWithImpl<_$AppMenuLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppMenuLinkImplToJson(
      this,
    );
  }
}

abstract class _AppMenuLink implements AppMenuLink {
  const factory _AppMenuLink(
      {@JsonKey(name: "id") final int id,
      @JsonKey(name: "show_name") final String showName,
      @JsonKey(name: "value") final String value}) = _$AppMenuLinkImpl;

  factory _AppMenuLink.fromJson(Map<String, dynamic> json) =
      _$AppMenuLinkImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "show_name")
  String get showName;
  @override
  @JsonKey(name: "value")
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$AppMenuLinkImplCopyWith<_$AppMenuLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
