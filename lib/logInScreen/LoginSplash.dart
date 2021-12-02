import 'dart:async';

import 'package:Facebook/SignUP/Email.dart';
import 'package:Facebook/SignUP/VerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:Facebook/blocs/auth/auth_bloc.dart';
import 'package:Facebook/blocs/auth/auth_events.dart';
import 'package:Facebook/blocs/auth/auth_states.dart';
import 'package:Facebook/Home/Home.dart';
import 'package:Facebook/logInScreen/loginscreen.dart';
import 'package:Facebook/SignUP/VerificationScreen.dart';

class loginSplash extends StatelessWidget{
  String phoneNum_or_Email, password;
  loginSplash({this.phoneNum_or_Email,this.password});

  @override
  Widget build(BuildContext context) {
    return splash(phoneNum_or_Email , password);
  }
}
class splash extends StatefulWidget{
  String phoneNum_or_Email, password;
  splash(this.phoneNum_or_Email,this.password);
  @override
  State<StatefulWidget> createState() {
    return _splash();
  }

}
class _splash extends State<splash>{
  bool isLoading = true;
  AuthBloc _authBloc = AuthBloc();
  bool flag =false;
  String r="";
  //SessionManager prefs =  SessionManager();
  @override
  void initState() {
    _authBloc.dispatch(LoginTapped(widget.phoneNum_or_Email,widget.password));
    _authBloc.subject.listen((AuthState state) {
      if(state is UserLogin)
      {
        r = state.user;
        print(r);
        if(r == 'success'){
          setState(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => Home()));
          });
           // isLoading = false;
        }
        else if(r == "Please check your email inbox for verification email"){
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => verification_email(Email: widget.phoneNum_or_Email
              ,password: widget.password)
          ));
        }
        else{
        setState(() {
          isLoading = false;
          showAlertDialog(context);
        });
      }
      }
    }
    );
    super.initState();
  }
  @override
   build(BuildContext context)  {
    // TODO: implement build
    //throw UnimplementedError();

    return Scaffold(

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            isLoading ?
            SizedBox(
              width: 25,
               height: 25,
               child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 3,))
                : Container(),
            // Navigator.push(
            //             context, MaterialPageRoute(builder: (_) => Home())),
            SizedBox(height: 15),
            Text("Logging in..." ,style: TextStyle(
              fontSize: 20
            ),),
          ],
        ),
      ),
    );
  }
  Future<AlertDialog> showAlertDialog(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: width-10,
            //margin: EdgeInsets.all(2.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 5),
                  //   child: Text("Error. ",
                  //       style: TextStyle(
                  //           fontSize: 20, fontFamily: "Roboto",)
                  //   ),),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text("Wrong credentials, Please try to login with a valid e-mail and password. ",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Roboto", )
                    ),),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => LoginScreen()));
                  //Navigator.of(context).pop();
                },
                child: Text("OK",style: TextStyle(fontSize: 17,color: Colors.blue),)),
            // FlatButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     child: Text("Reset Password",style: TextStyle(fontSize: 17),)),
          ],
        );
      },
    );
  }
}