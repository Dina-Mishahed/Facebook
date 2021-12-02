import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'ChangePassword.dart';

class Security extends StatefulWidget {
  get initialValue => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body:ListView(
          padding: EdgeInsets.all(10),
            children: <Widget>[
                Text(
                  "Security and Login",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 10,),
                Text(
                  "Recommended",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                ),
                ListTile(
                    leading:Icon(Icons.people_outline,color: Colors.grey,
                        size: 35),
                  title: Text(
                    "Choose friends to contact if you get locked out ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Nominate 3 to 5 friends help if you get locked out of your account. We recommend this to everyone.", style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff696969),
                  )),
                  trailing: Icon(Icons.navigate_next,color: Colors.grey,
                      size: 30),
                ),
                new Divider(color: Color(0xffDCDCDC) ,thickness: 1),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading:Icon(Icons.vpn_key,color: Colors.grey,
                      size: 35),
                  title: Text(
                    "Change password",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("It's a good idea to use a strong password that you're not using elsewhere", style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff696969),
                  )),
                  trailing: Icon(Icons.navigate_next,color: Colors.grey,
                      size: 30),
                  onTap:  () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChangePass()));
                  },
                ),
         ]));
  }
}
