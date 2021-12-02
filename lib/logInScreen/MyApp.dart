
import 'loginscreen.dart';
import 'package:flutter/material.dart';
//  qimport 'package:playwithui/ui/auth/signup_screen.dart';
//import 'initial_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      home : LoginScreen() ,
        // routes: {
        //   '/login': (BuildContext ctx) => LoginScreen(),
        //   '/home': (BuildContext ctx) => Home(),
        //   //'/logout': (BuildContext ctx) => logoutSplash(),
        // }
    );
  }

}

