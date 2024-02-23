// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "is_kyc")
  int? get is_kyc => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: "country_code")
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "is_verified")
  int? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "locale")
  String? get locale => throw _privateConstructorUsedError;
  @JsonKey(name: "is_vehicle")
  int? get is_vehicle => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "is_kyc") int? is_kyc,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "country_code") String countryCode,
      @JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "is_verified") int? isVerified,
      @JsonKey(name: "locale") String? locale,
      @JsonKey(name: "is_vehicle") int? is_vehicle,
      @JsonKey(name: "profile_image") String profileImage});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? is_kyc = freezed,
    Object? name = null,
    Object? email = null,
    Object? countryCode = null,
    Object? phoneNumber = null,
    Object? isVerified = freezed,
    Object? locale = freezed,
    Object? is_vehicle = freezed,
    Object? profileImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      is_kyc: freezed == is_kyc
          ? _value.is_kyc
          : is_kyc // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as int?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      is_vehicle: freezed == is_vehicle
          ? _value.is_vehicle
          : is_vehicle // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "is_kyc") int? is_kyc,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "email") String email,
      @JsonKey(name: "country_code") String countryCode,
      @JsonKey(name: "phone_number") String phoneNumber,
      @JsonKey(name: "is_verified") int? isVerified,
      @JsonKey(name: "locale") String? locale,
      @JsonKey(name: "is_vehicle") int? is_vehicle,
      @JsonKey(name: "profile_image") String profileImage});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? is_kyc = freezed,
    Object? name = null,
    Object? email = null,
    Object? countryCode = null,
    Object? phoneNumber = null,
    Object? isVerified = freezed,
    Object? locale = freezed,
    Object? is_vehicle = freezed,
    Object? profileImage = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      is_kyc: freezed == is_kyc
          ? _value.is_kyc
          : is_kyc // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as int?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      is_vehicle: freezed == is_vehicle
          ? _value.is_vehicle
          : is_vehicle // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "is_kyc") required this.is_kyc,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "country_code") required this.countryCode,
      @JsonKey(name: "phone_number") required this.phoneNumber,
      @JsonKey(name: "is_verified") required this.isVerified,
      @JsonKey(name: "locale") required this.locale,
      @JsonKey(name: "is_vehicle") required this.is_vehicle,
      @JsonKey(name: "profile_image") this.profileImage = ""});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "is_kyc")
  final int? is_kyc;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "email")
  final String email;
  @override
  @JsonKey(name: "country_code")
  final String countryCode;
  @override
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  @override
  @JsonKey(name: "is_verified")
  final int? isVerified;
  @override
  @JsonKey(name: "locale")
  final String? locale;
  @override
  @JsonKey(name: "is_vehicle")
  final int? is_vehicle;
  @override
  @JsonKey(name: "profile_image")
  final String profileImage;

  @override
  String toString() {
    return 'UserModel(id: $id, is_kyc: $is_kyc, name: $name, email: $email, countryCode: $countryCode, phoneNumber: $phoneNumber, isVerified: $isVerified, locale: $locale, is_vehicle: $is_vehicle, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.is_kyc, is_kyc) || other.is_kyc == is_kyc) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.is_vehicle, is_vehicle) ||
                other.is_vehicle == is_vehicle) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, is_kyc, name, email,
      countryCode, phoneNumber, isVerified, locale, is_vehicle, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "is_kyc") required final int? is_kyc,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "email") required final String email,
          @JsonKey(name: "country_code") required final String countryCode,
          @JsonKey(name: "phone_number") required final String phoneNumber,
          @JsonKey(name: "is_verified") required final int? isVerified,
          @JsonKey(name: "locale") required final String? locale,
          @JsonKey(name: "is_vehicle") required final int? is_vehicle,
          @JsonKey(name: "profile_image") final String profileImage}) =
      _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "is_kyc")
  int? get is_kyc;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "email")
  String get email;
  @override
  @JsonKey(name: "country_code")
  String get countryCode;
  @override
  @JsonKey(name: "phone_number")
  String get phoneNumber;
  @override
  @JsonKey(name: "is_verified")
  int? get isVerified;
  @override
  @JsonKey(name: "locale")
  String? get locale;
  @override
  @JsonKey(name: "is_vehicle")
  int? get is_vehicle;
  @override
  @JsonKey(name: "profile_image")
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
