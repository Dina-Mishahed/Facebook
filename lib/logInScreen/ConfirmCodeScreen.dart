import 'package:Facebook/blocs/auth/auth_bloc.dart';
import 'package:Facebook/blocs/auth/auth_events.dart';
import 'package:Facebook/blocs/auth/auth_states.dart';
import 'package:Facebook/logInScreen/loginscreen.dart';
import 'package:Facebook/strings/strings.dart';
import 'package:flutter/material.dart';

import 'CreateNewpass.dart';

class ConfirmCode extends StatelessWidget{
  String Email;
  ConfirmCode({this.Email});

  @override
  Widget build(BuildContext context) {
   return ConfirmViaEmail(Email);
  }


}
class ConfirmViaEmail extends StatefulWidget{
  get initialValue => null;
  String email;
  @override
  _ConfirmViaEmail createState() => _ConfirmViaEmail();
  ConfirmViaEmail(this.email);

}
class _ConfirmViaEmail extends State<ConfirmViaEmail>{

  int code;
  final GlobalKey<FormState> form_key = GlobalKey<FormState>();
  TextEditingController _textController;
  bool _wasEmpty;
  AuthBloc _authBloc = AuthBloc();
  String result;
  bool ErrorPIN= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);
    _wasEmpty = _textController.text.isEmpty;
    _textController.addListener(() {
      if (_wasEmpty != _textController.text.isEmpty)
        setState(() => {_wasEmpty = _textController.text.isEmpty});});
    _authBloc.subject.listen((AuthState state) {
      if(state is UserCode_ForgetPassword)
      {
        print("result = " + state.user.toString());
        if(state.user){
          Navigator.push(context, MaterialPageRoute(builder: (_) => CreateNewPass(email: widget.email,code:code)));
        }
        else{
          setState(() {
            ErrorPIN = true;
          });
        }
      }
    });
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  Widget bulidPassword() {
    return  TextFormField(
      keyboardType: TextInputType.number,
      cursorColor: Colors.grey,
      textAlign: TextAlign.center,
      decoration: InputDecoration(hintText: "######",hintStyle: TextStyle(fontSize: 20),
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
        try{
          code  = int.parse(value);
          if (value.trim().isEmpty) {
            return AppStrings.Password + AppStrings.EmptyFelid;
          }
          if(value.length != 6)
          {
            return "Code should be 6 numbers";
          }
          // else if(ErrorPIN)
          //   return "Try  Again Soon: inValid PIN";
          return null;

        }catch(Exception){}
       return "The code must contain numbers only";
      },
      onSaved: (String value) {
        code = int.parse(value);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    String email = widget.email;
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text ("Enter Security Code",style: TextStyle(color: Colors.black),),
        ),
        body:  Container(
          margin: EdgeInsets.only(left: 50,right: 50),
         child:SingleChildScrollView(
          child: Form(
            key: form_key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
          padding: EdgeInsets.only(top: 40),
          child:
              Center(
                child: Text("We Send Code to: $email",style: TextStyle(color: Colors.black
                    ,fontSize: 20),textAlign: TextAlign.center,),
              ),),
              Padding(
                padding: EdgeInsets.only(top: 5),
              child: Center(
                child: Text("Please check your email for a message with your code. Your code is 6 numbers long.",
                  style: TextStyle(color: Colors.black45
                    ,fontSize: 15,fontFamily: "Roboto"),textAlign: TextAlign.center,),
              ),),
              Padding(
                padding: EdgeInsets.only(top: 18, bottom: 3),
                child: Text("Enter the 6-digit code.",
                  style: TextStyle(color: Colors.black
                    ,fontSize: 20,),textAlign: TextAlign.center,),
              ),
              bulidPassword(),
              ErrorPIN  ? Text("Try  Again Soon: inValid PIN",style: TextStyle(color: Colors.red),): Container(),
              SizedBox(height: 30),
              Container(
                  width: double.infinity,
                  height: 45,
                  child: RaisedButton(
                    color: Colors.blue,
                    highlightElevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: ()  {
                      setState(() {
                        ErrorPIN = false;
                      });
                      if (form_key.currentState.validate())
                      {
                        form_key.currentState.save();
                        _authBloc.dispatch(Code_ForgetPasswordTapped(widget.email,code));
                    }
                    },
                  )),
              SizedBox(height: 5),
              Container(
                  width: double.infinity,
                  height: 45,
                  child: RaisedButton(
                    color: Colors.white,
                    highlightElevation: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Cancle',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: ()  {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => LoginScreen()
                        ));
                    },
                  )),
            ],
          ),
          ),),
        ),
    );
  }

}