import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Personal_Info.dart';
import 'Security.dart';

class Settings extends StatefulWidget {
  get initialValue => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Settings> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool typing = false;

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
          title: TextBox()),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: ListView(

          children: <Widget>[
            Text(
              "Accont Settings",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Manage information you, your payments and your contacts, and your account in general.",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff696969),
              ),
              //  textAlign: TextAlign.left,
            ),
            SizedBox(height: 10,),
            ListTile(
                leading: Icon(Icons.account_circle,color: Colors.grey,
                  size: 40),
                title: Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Update your name, phone numbers and email addresses", style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff696969),
                )),
               // trailing: Text("12:00"),
                onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonalInfo()));
                }),
            ListTile(
                leading: Icon(Icons.g_translate,color: Colors.grey,
                    size: 40),
                title: Text(
                  "Translation for Posts",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Let us know your translation preferences for posts from friends and bilingual posts.", style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff696969),
                )),
                // trailing: Text("12:00"),
                onTap: () {
                  debugPrint("Hello World");
                }),
            ListTile(
                leading: Icon(Icons.payment,color: Colors.grey,
                    size: 40),
                title: Text(
                  "Ads Payments",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Create and edit ads or manage your ads payments", style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff696969),
                )),
                // trailing: Text("12:00"),
                onTap: () {
                  debugPrint("Hello World");
                }),
            ListTile(
                leading: Icon(Icons.payment,color: Colors.grey,
                    size: 40),
                title: Text(
                  "Facebook Pay",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Manage your payment settings, see your payment history and access live chat support.", style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff696969),
                )),
                // trailing: Text("12:00"),
                onTap: () {
                  debugPrint("Hello World");
                }),
        new Divider(color: Color(0xffDCDCDC) ,thickness: 5),
            Text(///////////////////********************Change Passward**************************************
              "Security",
              //textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Change your password and take other actions to add more security to your account. ",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff696969),
              ),
              //  textAlign: TextAlign.left,
            ),
            ListTile(
                leading: Icon(Icons.security,color: Colors.grey,
                    size: 40),
                title: Text(
                  " Security and Login",//******************CHANGE PASSWARD******************
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Change your password and take other actions to add more security to your account.", style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff696969),
                )),
                // trailing: Text("12:00"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Security()));
                }),
            ListTile(
                leading: Icon(Icons.threesixty,color: Colors.grey,
                    size: 40),
                title: Text(
                  "Apps and Websites",//******************CHANGE PASSWARD******************
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("Manage your payment settings, see your payment history and access live chat support.", style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff696969),
                )),
                // trailing: Text("12:00"),
                onTap: () {
                  debugPrint("Hello World");
                }),
          ],
        )
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        height: 35,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search Settings',
            prefixIcon: Icon(Icons.search),
            hintStyle: TextStyle(
              fontSize: 15,
            ),
            contentPadding: EdgeInsets.only(top: 20.0),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 10.0,
                ),
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ));
  }
}
