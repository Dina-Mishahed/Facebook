import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User_Login{
  String email_or_phone;
  String password;
  User_Login(this.email_or_phone,this.password);

  factory User_Login.fromJson(Map<String, dynamic> json) => _$User_LoginFromJson(json);
  Map<String, dynamic> toJson() => _$User_LoginToJson(this);
}