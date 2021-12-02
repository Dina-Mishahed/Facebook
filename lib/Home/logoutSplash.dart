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
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class logoutSplash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return splash();
  }

}
class splash extends StatefulWidget{
  splash();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _splash();
  }

}
class _splash extends State<splash>{
  bool isLoading = true;
  AuthBloc _authBloc = AuthBloc();
  bool flag =false;
  @override
  void initState()  {
    super.initState();
    _authBloc.dispatch(LogoutTapped());
    _authBloc.subject.listen((AuthState state) async {
      if(state is UserLogout)
      {
        try{
          final prefs = await SharedPreferences.getInstance();
          prefs.remove('Token');
          print(prefs.getString('Token'));
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
        }
        catch(Exception){
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
        }

      }
    }
    );

  }
  @override
  build(BuildContext context)  {
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
            Text("Logging out..." ,style: TextStyle(
                fontSize: 20
            ),),
          ],
        ),
      ),
    );
  }
}