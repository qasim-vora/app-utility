// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int,
      is_kyc: json['is_kyc'] as int?,
      name: json['name'] as String,
      email: json['email'] as String,
      countryCode: json['country_code'] as String,
      phoneNumber: json['phone_number'] as String,
      isVerified: json['is_verified'] as int?,
      locale: json['locale'] as String?,
      is_vehicle: json['is_vehicle'] as int?,
      profileImage: json['profile_image'] as String? ?? "",
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_kyc': instance.is_kyc,
      'name': instance.name,
      'email': instance.email,
      'country_code': instance.countryCode,
      'phone_number': instance.phoneNumber,
      'is_verified': instance.isVerified,
      'locale': instance.locale,
      'is_vehicle': instance.is_vehicle,
      'profile_image': instance.profileImage,
    };
