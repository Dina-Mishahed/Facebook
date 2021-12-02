
abstract class  AuthEvent{}
class SignUpTapped extends AuthEvent {
  String firstName;
  String lastName;
  String birthday;
  String gender;
  String phone;
  String email;
  String password;
  SignUpTapped(this.firstName,this.lastName,this.birthday,this.gender
      ,this.phone, this.email, this.password);
}
class LoginTapped extends AuthEvent{
  String phoneNum_or_Email;
  String password;
  LoginTapped(this.phoneNum_or_Email,this.password);
}

class LogoutTapped extends AuthEvent{
  LogoutTapped();
}

class ForgetPsswordTapped extends AuthEvent{
  String Email;
  ForgetPsswordTapped(this.Email);
}
class Code_ForgetPasswordTapped extends AuthEvent{
  String Email;
  int Code;
  Code_ForgetPasswordTapped(this.Email,this.Code);
}
class FinishRestPasswordTapped extends AuthEvent{
  String Email,Password;
  int Code;
  FinishRestPasswordTapped(this.Email,this.Code,this.Password);
}