
import 'package:Facebook/Home/Home.dart';
import 'package:Facebook/SignUP/SignUP.dart';
import 'package:Facebook/strings/strings.dart';
import 'package:flutter_session/flutter_session.dart';
import 'identify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Facebook/logInScreen/LoginSplash.dart';

class LoginScreen extends StatefulWidget {
  get initialValue => null;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> form_key = GlobalKey<FormState>();
  TextEditingController _textController;
  TextEditingController _textController2;
  var session = FlutterSession();
  bool _wasEmpty;
  String phoneNum_or_Email;
  bool _obscureText = true;
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> initState()   {
    super.initState();
    //var token = await session.get("Token");
   // print(token);
    // if(token != "null" || !token.toString().isEmpty ){
    //   Future.delayed(Duration(seconds: 1),
    //           (){
    //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home(),),);
    //       }
    //   );
    // }
    _textController = TextEditingController(text: widget.initialValue);
    _textController2 = TextEditingController(text: widget.initialValue);
    _wasEmpty = _textController.text.isEmpty;
    _wasEmpty = _textController2.text.isEmpty;
    _textController.addListener(() {
      if (_wasEmpty != _textController.text.isEmpty)
        setState(() => {_wasEmpty = _textController.text.isEmpty});});
    _textController2.addListener(() {
      if (_wasEmpty != _textController2.text.isEmpty)
        setState(() => {_wasEmpty = _textController2.text.isEmpty});});
  }
  @override
  void dispose() {
    _textController.dispose();
    _textController2.dispose();
    super.dispose();
  }

  Widget bulidMobileOrEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: AppStrings.Mobile_number + " or email" ,
          suffixIcon: _textController.text.isNotEmpty
              ? new IconButton(
            iconSize: 22,
            icon: Icon(Icons.clear,color: Colors.grey,),
            onPressed: (){
              setState(() {
                _textController.clear();
              });
            },

          ) : null
      ),
      controller: _textController,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.Mobile_number + " or email are required";
        }
        try {
          var number = double.parse(value.trim());
        }catch(e)
        {
          if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return AppStrings.emailAddress + AppStrings.NotValied;
          }
        }
        return null;
      },
      onSaved: (String value) {
        phoneNum_or_Email = value.trim();
      },
    );
  }
  String password;
  Widget bulidPassword() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(labelText: AppStrings.Password,
        suffixIcon: _textController2.text.isNotEmpty ?
        IconButton(
          icon:Icon(_obscureText ? Icons.visibility_off : Icons.visibility,),
          onPressed: _togglePasswordStatus,
          color: Colors.black38,
        ) : null
      ),
      obscureText: _obscureText,
      controller: _textController2,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.Password + AppStrings.EmptyFelid;
        }
        if(value.length<8)
        {
          return "Password should be at least 8";
        }
        return null;
      },
      onSaved: (String value) {
        password = value;
      },

    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: form_key,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.indigo,
                    width: width,
                    child: Image.asset("images/fb.jpg"),),
                Text("Dzongkha   English   more.....",style: TextStyle(fontSize: 16),) ,
                SizedBox(
                  height: 25,
                ),
                Padding(
                  // padding: const EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child:  bulidMobileOrEmail()
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  // padding: const EdgeInsets.all(8.0),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child:bulidPassword()
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: 280,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.blue,
                      highlightElevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () => {
                        if (form_key.currentState.validate())
                          {
                            form_key.currentState.save(),
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (_) => loginSplash(phoneNum_or_Email: phoneNum_or_Email
                                ,password: password)
                            )),
                          }

                      },
                    )),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  child: Container(
                    // alignment:Alignment.centerright ,
                      child: Text("Forget Password ?",
                          style: TextStyle(
                            color: Color(0xFF398AE5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                          ))),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => Forgot_passwordScreen()));
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Text("----------------------OR-----------------------"),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: 280,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.green,
                      highlightElevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text("Create New Account ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Courgetter',
                            fontSize: 20,
                            letterSpacing: 2,
                          )),
                      onPressed: () => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>SignUP()))
                      },
                    )),
              ],
            ),
          ),
        ));
  }
}
