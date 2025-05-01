import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? displayName;
  String? email;
  String? token;
  String? appUserId;
  String? role;

  SignupResponse({
    this.displayName,
    this.email,
    this.token,
    this.appUserId,
    this.role,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
