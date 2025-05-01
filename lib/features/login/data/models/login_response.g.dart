// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      appUserId: json['appUserId'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'token': instance.token,
      'appUserId': instance.appUserId,
      'role': instance.role,
    };
