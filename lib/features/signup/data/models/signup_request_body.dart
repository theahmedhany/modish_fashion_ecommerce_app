import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String email;
  final String userName;
  final String password;
  final String confirmPassword;

  SignupRequestBody({
    required this.email,
    required this.userName,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
