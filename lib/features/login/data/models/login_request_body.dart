import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String emailOrUserName;
  final String password;

  LoginRequestBody({required this.emailOrUserName, required this.password});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
