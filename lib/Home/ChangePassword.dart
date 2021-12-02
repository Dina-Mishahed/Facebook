
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Facebook/strings/strings.dart';
import 'Security.dart';

class ChangePass extends StatefulWidget {
  get initialValue => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChangePass> {
  final GlobalKey<FormState> form_key = GlobalKey<FormState>();
  String PassWord, NewPass, Re_typeNewPass;

  Widget bulidPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Current " + AppStrings.Password,
      ),
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value
            .trim()
            .isEmpty) {
          return AppStrings.Password + AppStrings.EmptyFelid;
        }
        if (value.length < 8) {
          return "Password should be at least 8";
        }
        return null;
      },
      onSaved: (String value) {
        PassWord = value;
      },
    );
  }

  Widget bulidNewPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: "New " + AppStrings.Password,
      ),
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value
            .trim()
            .isEmpty) {
          return AppStrings.Password + AppStrings.EmptyFelid;
        }
        if (value.length < 8) {
          return "Password should be at least 8";
        }
        return null;
      },
      onSaved: (String value) {
        NewPass = value;
      },
    );
  }

  Widget bulidReTypePassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Re-type new " + AppStrings.Password,
      ),
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.Password + AppStrings.EmptyFelid;
        }
        if (value.length < 8) {
          return "Password should be at least 8";
        }
        return null;
      },
      onSaved: (String value) {
        Re_typeNewPass = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(content: Text('Password Changed Successfully'),behavior: SnackBarBehavior.floating,);
    final snackBar2 = SnackBar(content: Text('You must enter the same passward twice',style: TextStyle(color:Colors.red),),behavior: SnackBarBehavior.floating,);
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffD3D3D3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Change Password", style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Builder(
        builder: (context) =>
        Center(
          child:Form(
          key: form_key,
          child: Container(
            color:  Color(0xffD3D3D3),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Column(children: <Widget>[
          Container(
            alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10),
            width:double.infinity,
            height: 280,
            color: Colors.white,
            child: Column(children: <Widget>[
              Container(
                  height: 80, width: double.infinity, child: bulidPassword()),
              Container(
                  height: 80,
                  width: double.infinity,
                  child: bulidNewPassword()),
              Container(
                  height: 80,
                  width: double.infinity,
                  child: bulidReTypePassword()),
          ])),
              Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.all(5),
                color: Colors.white,
                  child: RaisedButton(
                    color: Colors.blue,
                    highlightElevation: 30,
                    child: Text(
                      'Save Changes',
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      if (form_key.currentState.validate()) {
                        form_key.currentState.save();
                        if(Re_typeNewPass.compareTo(NewPass)!=0)
                          {
                            Scaffold.of(context).showSnackBar(snackBar2);

                          }
                        else  Scaffold.of(context).showSnackBar(snackBar);
                      }
                    },
                  )),
              Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.white,
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
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Security()));
                    },
                  ))
            ],),
          ),))),

    );
  }
}

