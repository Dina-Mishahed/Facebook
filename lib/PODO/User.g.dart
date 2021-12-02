// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User_Login _$User_LoginFromJson(Map<String, dynamic> json) {
  return User_Login(
    json['email_or_phone'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$User_LoginToJson(User_Login instance) =>
    <String, dynamic>{
      'email_or_phone': instance.email_or_phone,
      'password': instance.password,
    };
