import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Edit_profile_details.dart';

class PersonalInfo extends StatefulWidget {
  get initialValue => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 5, right: 5),
    child: ListView(
    children: <Widget>[
      Text(
        "Personal Information",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 15),
      Text(
        "Genaral",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10,),
      ListTile(
         // leading: ,
          title: Text(
            "Edit Profile Details",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Name, Phone and Birthday", style: TextStyle(
            fontSize: 12,
            color: Color(0xff696969),
          )),
          trailing: Icon(Icons.navigate_next,color: Colors.grey,
              size: 40),
          onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfile()));
          }),
      new Divider(color: Color(0xffDCDCDC) ,thickness: 1),
      ListTile(
        // leading: ,
          title: Text(
            "Contact Info",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Manage your emails", style: TextStyle(
            fontSize: 12,
            color: Color(0xff696969),
          )),
          trailing: Icon(Icons.navigate_next,color: Colors.grey,
              size: 40),
          onTap: () {
            debugPrint("Hello World");
          }),
      new Divider(color: Color(0xffDCDCDC) ,thickness: 1,),
      ListTile(
        // leading: ,
          title: Text(
            "Identity Confirmation",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Confirmation your identity on facebook", style: TextStyle(
            fontSize: 12,
            color: Color(0xff696969),
          )),
          trailing: Icon(Icons.navigate_next,color: Colors.grey,
              size: 40),
          onTap: () {
            debugPrint("Hello World");
          }),
      new Divider(color: Color(0xffDCDCDC),thickness: 1 ),
      ListTile(
        // leading: ,
          title: Text(
            "Manage Account",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("Legacy Contact and Deactivation Settings", style: TextStyle(
            fontSize: 12,
            color: Color(0xff696969),
          )),
          trailing: Icon(Icons.navigate_next,color: Colors.grey,
              size: 40),
          onTap: () {
            debugPrint("Hello World");
          }),
    ]
    )

        )
    );
  }
}