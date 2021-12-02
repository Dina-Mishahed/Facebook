
import 'package:Facebook/Home/Edit_profile_details.dart';
import 'package:Facebook/Home/Home.dart';
import 'package:Facebook/logInScreen/MyApp.dart' show MyApp;
import 'package:Facebook/logInScreen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Facebook',
      home: FacebookSplashScreen(),);
  }
}
class FacebookSplashScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FacebookSplashScreen();
  }

}
class _FacebookSplashScreen extends State<FacebookSplashScreen>{
 int counter = 1;

 bool token;
  Future<void> getToken() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   //token = prefs.getString('Token') ?? null;
   token = prefs.containsKey('Token')?? false;
 }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(()  {
      print(token);
      if(token == true){
        Future.delayed(Duration(seconds: 5),
                (){
              setState(() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home(),),);
              });
            }
        );
      }
      else{
        Future.delayed(Duration(seconds: 5),
                (){
              setState(() {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyApp(),),);
              });
            }
        );
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget smallCircle (Color color){
      return Container(
        width: 10.0,
        height: 10.0,
        decoration: new BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
        body:
        SafeArea(
        child: SingleChildScrollView(
        child:
            Column(
              children: [
                // SizedBox(
                //   width: width/2.0,
                //   height: height/2.0,
                // ),
                Padding(
                  padding: EdgeInsets.only(top: height/2.0-50,bottom: 50),
                  child:Center(
                    child: Container(
                        height: 80,
                        width: 80,
                        child: Image.asset("images/FacebookLogo.jpg")),
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width/2.0-40),
                        child: smallCircle(counter == 1 ?  Colors.blue :Colors.grey),
                        
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: smallCircle(counter == 2 ?  Colors.blue :Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: smallCircle(counter == 3 ?  Colors.blue :Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: smallCircle(counter == 4 ?  Colors.blue :Colors.grey),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: smallCircle(counter == 5 ?  Colors.blue :Colors.grey),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:Center(
                    child: Container(
                        height: 200,
                        width: 1000,
                        child: Image.asset("images/logos.jpeg")),
                  ),
                ),
              ],
            ),
      ),));

  }

}

