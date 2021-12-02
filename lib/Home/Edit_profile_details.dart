
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Facebook/strings/strings.dart';

class EditProfile extends StatefulWidget {
  get initialValue => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EditProfile> {
  final GlobalKey<FormState> form_key = GlobalKey<FormState>();
  final GlobalKey<FormState> form_key2 = GlobalKey<FormState>();
  final GlobalKey<FormState> form_key3 = GlobalKey<FormState>();
  String first_name;
  String middle_name;
  String Last_name;

  Widget bulidFirstName() {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 15, height: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 10.0,
          ),
        ),
      ),
      style: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.fisrt_name + AppStrings.EmptyFelid;
        }
        return null;
      },
      onSaved: (String value) {
        first_name = value.trim();
      },
    );
  }

  Widget bulidMiddleName() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 5.0,
          ),
        ),
      ),
      style: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return "Middle Name" + AppStrings.EmptyFelid;
        }
        return null;
      },
      onSaved: (String value) {
        middle_name = value.trim();
      },
    );
  }

  Widget bulidLastName() {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 15, height: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 10.0,
          ),
        ),
      ),
      style: TextStyle(
        fontSize: 20,
        fontFamily: "Roboto",
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.last_name + AppStrings.EmptyFelid;
        }
        return null;
      },
      onSaved: (String value) {
        Last_name = value.trim();
      },
    );
  }

  String phone_number;

  Widget bulidMobile() {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 15, height: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 10.0,
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.Mobile_number + AppStrings.EmptyFelid;
        }
        try {
          var number = double.parse(value.trim());
        } catch (e) {
          return AppStrings.invalid + AppStrings.Mobile_number;
        }
        return null;
      },
      onSaved: (String value) {
        phone_number = value.trim();
      },
    );
  }
  String email = "";
  Widget bulidEmail() {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 15, height: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 10.0,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.emailAddress + AppStrings.EmptyFelid;
        }
        if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return AppStrings.emailAddress + AppStrings.NotValied;
        }
        return null;
      },
      onSaved: (String value) {
        email = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD3D3D3),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: "Roboto"),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Form(
              key: form_key,
              child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: 350,
                  height: 525,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Color(0xffDCDCDC),
                        thickness: 1,
                      ),
                      Text(
                        "First name",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Container(
                          height: 45, width: 225, child: bulidFirstName()),
                      Text(
                        "Middle name",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Container(
                          height: 45, width: 225, child: bulidMiddleName()),
                      Text(
                        "Last name",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Container(height: 45, width: 225, child: bulidLastName()),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        height: 120,
                        width: double.infinity,
                        color: Color(0xffF0F0F0),
                        child: RichText(
                            softWrap: true,
                            textAlign: TextAlign.left,
                            //  overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            text: TextSpan(
                              text: 'Please note: ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff808080),
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'If you change your name \non Facebook, you can\'t change it again for 60 days. '
                                      'Don\'t add any unusual \ncapitalization, punctuation, '
                                      'characters or random words.',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff888888),
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            )),
                      ),
                      Container(
                          width: double.infinity,
                          height: 40,
                          margin: EdgeInsets.all(5),
                          child: RaisedButton(
                            color: Colors.blue,
                            highlightElevation: 30,
                            child: Text(
                              'Review Change',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              if (form_key.currentState.validate()) {
                                form_key.currentState.save();
                              }
                            },
                          )),
                      Container(
                          width: double.infinity,
                          height: 40,
                          margin: EdgeInsets.all(5),
                          child: RaisedButton(
                            color: Colors.white,
                            highlightElevation: 10,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey, width: 1)),
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            onPressed: () {},
                          ))
                    ],
                  ))),
          Form(
              key: form_key2,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 350,
                height: 170,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Phone",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Color(0xffDCDCDC),
                        thickness: 1,
                      ),
                      Text(
                        AppStrings.Mobile_number,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Container(height: 35, width: 225, child: bulidMobile()),
                      Container(
                          width: double.infinity,
                          height: 40,
                          margin: EdgeInsets.all(5),
                          child: RaisedButton(
                            color: Colors.blue,
                            highlightElevation: 30,
                            child: Text(
                              'Change',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              if (form_key2.currentState.validate()) {
                                form_key2.currentState.save();
                              }
                            },
                          )),
                    ]),
              )),
          Form(
              key: form_key3,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                width: 350,
                height: 170,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        AppStrings.emailAddress,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Color(0xffDCDCDC),
                        thickness: 1,
                      ),
                      Text(
                        AppStrings.emailAddress,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Container(height: 35, width: 225, child: bulidEmail()),
                      Container(
                          width: double.infinity,
                          height: 40,
                          margin: EdgeInsets.all(5),
                          child: RaisedButton(
                            color: Colors.blue,
                            highlightElevation: 30,
                            child: Text(
                              'Change',
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              if (form_key3.currentState.validate()) {
                                form_key3.currentState.save();
                              }
                            },
                          )),
                    ]),
              ))
        ],
      )),
    );
  }
}
