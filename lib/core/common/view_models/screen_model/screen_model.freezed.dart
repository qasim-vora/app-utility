// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScreenModel {
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "path")
  String get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScreenModelCopyWith<ScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenModelCopyWith<$Res> {
  factory $ScreenModelCopyWith(
          ScreenModel value, $Res Function(ScreenModel) then) =
      _$ScreenModelCopyWithImpl<$Res, ScreenModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String title,
      @JsonKey(name: "path") String path});
}

/// @nodoc
class _$ScreenModelCopyWithImpl<$Res, $Val extends ScreenModel>
    implements $ScreenModelCopyWith<$Res> {
  _$ScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreenModelImplCopyWith<$Res>
    implements $ScreenModelCopyWith<$Res> {
  factory _$$ScreenModelImplCopyWith(
          _$ScreenModelImpl value, $Res Function(_$ScreenModelImpl) then) =
      __$$ScreenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String title,
      @JsonKey(name: "path") String path});
}

/// @nodoc
class __$$ScreenModelImplCopyWithImpl<$Res>
    extends _$ScreenModelCopyWithImpl<$Res, _$ScreenModelImpl>
    implements _$$ScreenModelImplCopyWith<$Res> {
  __$$ScreenModelImplCopyWithImpl(
      _$ScreenModelImpl _value, $Res Function(_$ScreenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? path = null,
  }) {
    return _then(_$ScreenModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScreenModelImpl implements _ScreenModel {
  const _$ScreenModelImpl(
      {@JsonKey(name: "title") required this.title,
      @JsonKey(name: "path") required this.path});

  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "path")
  final String path;

  @override
  String toString() {
    return 'ScreenModel(title: $title, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreenModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreenModelImplCopyWith<_$ScreenModelImpl> get copyWith =>
      __$$ScreenModelImplCopyWithImpl<_$ScreenModelImpl>(this, _$identity);
}

abstract class _ScreenModel implements ScreenModel {
  const factory _ScreenModel(
      {@JsonKey(name: "title") required final String title,
      @JsonKey(name: "path") required final String path}) = _$ScreenModelImpl;

  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "path")
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$ScreenModelImplCopyWith<_$ScreenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
