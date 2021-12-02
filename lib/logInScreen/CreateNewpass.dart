import 'package:Facebook/blocs/auth/auth_bloc.dart';
import 'package:Facebook/blocs/auth/auth_events.dart';
import 'package:Facebook/blocs/auth/auth_states.dart';
import 'package:Facebook/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Facebook/Home/Home.dart';


import 'loginscreen.dart';

class CreateNewPass extends StatelessWidget{
  String email;
  int code;
  CreateNewPass({this.email,this.code});

  @override
  Widget build(BuildContext context) {
    //print(email+" "+code);
    return NewPassword(email,code);
  }


}
class NewPassword extends StatefulWidget{
  get initialValue => null;
  String email;
  int code;
  NewPassword(this.email,this.code);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewPassword();
  }
}
class _NewPassword extends State<NewPassword>{
  String password;
  final GlobalKey<FormState> form_key = GlobalKey<FormState>();
  TextEditingController _textController;
  bool _wasEmpty;
  bool _obscureText = true;
  AuthBloc _authBloc = AuthBloc();
  FToast fToast;
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
      if(state is UserFinishResetPassword)
      {

        if(state.user=="true"){
          print("Finish Reset Password");

          fToast = FToast();
          fToast.init(context);
          fToast.showToast(
              child: _showToast(),
              gravity: ToastGravity.BOTTOM,
              toastDuration: Duration(seconds: 2),);
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        }
        else{
          print("Error");
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
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Colors.grey,
      textAlign: TextAlign.center,
      decoration: InputDecoration(hintText: "Type a new password",hintStyle: TextStyle(fontSize: 20),
          suffixIcon: _textController.text.isNotEmpty ?
          IconButton(
            icon:Icon(_obscureText ? Icons.visibility_off : Icons.visibility,),
            onPressed: _togglePasswordStatus,
            color: Colors.black38,
          ) : null
      ),
      obscureText: _obscureText,
      controller: _textController,
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
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text ("Reset Your Password",style: TextStyle(color: Colors.black),),

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
                child: Text("Create a New Password",style: TextStyle(color: Colors.black
                    ,fontSize: 22),textAlign: TextAlign.center,),
              ),),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text("You'll use this password to access your account.",style: TextStyle(color: Colors.black
                    ,fontSize: 16,fontFamily: "Roboto"),textAlign: TextAlign.center,),
              ),),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Center(
                child: Text("Enter a combination of at least eight numbers,letters,and punctuation marks.",
                  style: TextStyle(color: Colors.black54
                    ,fontSize: 16,),textAlign: TextAlign.center,),
              ),),

            bulidPassword(),
            SizedBox(height: 20),
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
                    if (form_key.currentState.validate())
                    {
                      form_key.currentState.save();
                      _authBloc.dispatch(FinishRestPasswordTapped(widget.email,widget.code,password));
                    }

                  },
                )),

          ],
        ),
        ),),
      ),
    );
  }
  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Finish Reset Password"),
        ],
      ),
    );
  }
}