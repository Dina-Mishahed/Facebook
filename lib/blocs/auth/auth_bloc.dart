
import 'package:Facebook/blocs/auth/auth_events.dart';
import 'package:Facebook/services/AuthServices.dart';

import '../bloc.dart';
import 'auth_states.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BLOC<AuthEvent>{
  PublishSubject<AuthState> subject = PublishSubject<AuthState>();
  AuthServices _authServices =  AuthServices();

  @override
  void dispatch(AuthEvent event) {
    if( event is SignUpTapped){
      _SignUp(event.firstName ,event.lastName ,event.birthday
          ,event.gender,event.phone,event.email,event.password);
    }
    else if(event is LoginTapped){
      _Login(event.phoneNum_or_Email, event.password);
    }
    else if( event is LogoutTapped){
      _Logout();
    }
    else if(event is ForgetPsswordTapped){
      _ForgetPassword(event.Email);
    }
    else if(event is Code_ForgetPasswordTapped){
      _Code_ForgetPassword(event.Email,event.Code);
    }
    else if(event is FinishRestPasswordTapped){
      _FinishResetPassword(event.Email,event.Code,event.Password);
    }
  }
  Future<void>_SignUp(String firstName ,String lastName ,String birhtday,
      String gender,String Phone, String Email,String pass)async{
    await Future.delayed(Duration(seconds: 5));
   var user = await _authServices.SiginUp(firstName, lastName, birhtday, gender, Phone, Email, pass);
    subject.add(UserSignUp(user));
  }
  Future<void>_Login(String Email ,String password) async {
    var user =await _authServices.Login(Email, password);
   // await Future.delayed(Duration(seconds: 10));
    subject.add(UserLogin(user));
  }

  Future<void>_Logout() async {
    // var Email =await FlutterSession().get("email");
    // var password =await FlutterSession().get("password");
    // print("Email Or Phone = " + phoneNum_or_Email + "Password = " + password );
    var user =await _authServices.Logout();
    await Future.delayed(Duration(seconds: 10));
    subject.add(UserLogout(user));
  }

  Future<void> _ForgetPassword(String Email ) async {
    var user =await _authServices.ForgetPassword(Email);
    //await Future.delayed(Duration(seconds: 5));
    subject.add(UserForgetPassword(user));
  }
  Future<void> _Code_ForgetPassword(String Email, int Code ) async {
    var user =await _authServices.Code_ForgetPassword(Email, Code);
   // await Future.delayed(Duration(seconds: 10));
    subject.add(UserCode_ForgetPassword(user));
  }
  Future<void> _FinishResetPassword(String Email, int Code ,String Passwpord) async {
    var user =await _authServices.FinishResetPassword(Email, Code,Passwpord);
    subject.add(UserFinishResetPassword(user));
  }
}
