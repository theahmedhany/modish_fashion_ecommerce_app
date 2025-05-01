import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? displayName;
  String? email;
  String? token;
  String? appUserId;
  String? role;

  LoginResponse({
    this.displayName,
    this.email,
    this.token,
    this.appUserId,
    this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
