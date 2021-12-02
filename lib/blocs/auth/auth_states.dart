
abstract class AuthState{}
class UserSignUp extends AuthState{
  var user;
  UserSignUp(this.user);
}
class UserLogin extends AuthState{
  var user;
  UserLogin(this.user);
}

class UserLogout extends AuthState{
  var user;
  UserLogout(this.user);
}

class UserForgetPassword extends AuthState{
  var user;
  UserForgetPassword(this.user);
}
class UserCode_ForgetPassword extends AuthState{
  var user;
  UserCode_ForgetPassword(this.user);
}
class UserFinishResetPassword extends AuthState{
  var user;
  UserFinishResetPassword(this.user);
}