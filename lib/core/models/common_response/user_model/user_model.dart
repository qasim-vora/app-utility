import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "is_kyc") required int? is_kyc,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "country_code") required String countryCode,
    @JsonKey(name: "phone_number") required String phoneNumber,
    @JsonKey(name: "is_verified") required int? isVerified,
    @JsonKey(name: "locale") required String? locale,
    @JsonKey(name: "is_vehicle") required int? is_vehicle,
    @JsonKey(name: "profile_image") @Default("") String profileImage,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
