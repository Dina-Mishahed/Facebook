
import 'package:Facebook/SignUP/Email.dart';
import 'package:Facebook/blocs/auth/auth_bloc.dart';
import 'package:Facebook/blocs/auth/auth_events.dart';
import 'package:Facebook/blocs/auth/auth_states.dart';
import 'package:Facebook/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ConfirmCodeScreen.dart';
import 'loginscreen.dart';
class Forgot_passwordScreen extends StatefulWidget {
  get initialValue => null;
  @override
  _Forgot_passwordScreenState createState() => _Forgot_passwordScreenState();
}

class _Forgot_passwordScreenState extends State<Forgot_passwordScreen> {
  final GlobalKey<FormState> form_key = GlobalKey<FormState>();
  TextEditingController editController = TextEditingController();
  String email ;
  TextEditingController _textController ;
  bool Loading_visible = false;
  bool _wasEmpty;
  AuthBloc _authBloc = AuthBloc();
  String result;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);

   // _authBloc.dispatch(ForgetPsswordTapped(email));
    _textController.addListener(() {
      if (_wasEmpty != _textController.text.isEmpty)
        setState(() => {_wasEmpty = _textController.text.isEmpty});});
    _authBloc.subject.listen((AuthState state) {
      if(state is UserForgetPassword)
      {
        print(email);
        result = state.user;
        Loading_visible = false;

        if(result == 'true'){
           // Future.delayed( const Duration(milliseconds: 5000),);
          Navigator.push(context, MaterialPageRoute(builder: (_) => ConfirmCode(Email:  email,)));
        }
        else{
          showAlertDialog(context);
        }
      }
    });
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text ("Find Your Account",style: TextStyle(color: Colors.black),),
      ),
      body:  Container(
        margin: EdgeInsets.all(25),
        child: Form(
        key: form_key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          TextFormField(
            cursorColor: Colors.grey,
            decoration: InputDecoration( hintText: "Email",
                //border: OutlineInputBorder(),
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
                return "Email are required";
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
              email = value.trim();
            },
          ),
            Padding(
              padding: EdgeInsets.only(top: 15),
                child:  Container(
                      padding: EdgeInsets.only(left: 5),
                      width:MediaQuery.of(context).size.width-50,
                         child: RaisedButton(
                             color: Colors.blue,
                             onPressed: !Loading_visible ?() {
                               if (form_key.currentState.validate())
                               {
                                 form_key.currentState.save();
                                 print("Email= "+email);
                                 _authBloc.dispatch(ForgetPsswordTapped(email));
                                 setState(() {
                                   Loading_visible = true;
                                 });
                               }
                               }:null,
                             child: Text("Find Your Account",
                               style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Roboto',
                               ),
                             )

                         ),
                       )
                  ),
            SizedBox(height: 50),
            Loading_visible ? Center( child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black45),
                strokeWidth: 4)) : Container(),
          ],
        ),
      ),));
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                 child: Text(
                      "No account match that information.",
                      style: TextStyle(
                          fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.bold)
                  ),),
                  Text(
                      "Make sure you've entered the correct email address.",
                      style: TextStyle(
                          fontSize: 18, fontFamily: "Roboto", color: Colors.black54)
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("SEARCH AGAIN",style: TextStyle(fontSize: 17),)),
          ],
        );
      },
    );
  }
}
