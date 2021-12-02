
import 'package:Facebook/logInScreen/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Facebook/blocs/auth/auth_bloc.dart';
import 'package:Facebook/blocs/auth/auth_events.dart';
import 'package:Facebook/blocs/auth/auth_states.dart';
import 'package:Facebook/Home/Home.dart';

class verification_email extends StatelessWidget{
  String Email, password;
  verification_email({this.Email,this.password});
  @override
  Widget build(BuildContext context)
  {
    return verification(Email,password);
  }
}
class verification extends StatefulWidget{
  String Email, password;
  verification(this.Email,this.password);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _verification();
  }

}
class _verification extends State<verification>{
  bool _isButtonDisabled =true;
  AuthBloc _authBloc = AuthBloc();
  @override
  void initState() {
    _authBloc.dispatch(LoginTapped(widget.Email,widget.password));
    _authBloc.subject.listen((AuthState state) {
      if(state is UserLogin) {
        String r = state.user;
        print(r);
        if (r == 'success')
          setState(() {
            _isButtonDisabled = false;
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
        backgroundColor: Colors.white,
          title: Text("Account Confirmation",
          style: TextStyle(
          fontSize: 20, color: Colors.black, fontFamily: "Roboto"),
          ),
          ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50, top: 80,right: 50,bottom: 20),
                child: Text("Please check your email inbox for verification email",
                style: TextStyle(
                  fontSize: 20,
                ),),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                  color: Colors.blue,
                  highlightElevation: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Confirm',
                    style:
                    TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed:(){
                    _showMyDialog();
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context)=>Home()),
                            // );

                  }
                ),
              ),
            ],
          ),
          )
      );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation Email'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please check your email inbox for verification email.'),
                Text('Would you skip this step later?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Not Now',style: TextStyle(color: Colors.black),),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>LoginScreen()),
                );
              },
            ),
            FlatButton(
              child: Text('check'),
              onPressed: () {
                _authBloc.dispatch(LoginTapped(widget.Email,widget.password));
                  _authBloc.subject.listen((AuthState state) {
                    if(state is UserLogin) {
                      String r = state.user;
                      print(r);
                      if (r == 'success'){
                        setState(() {
                          Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>Home()),
                              );
                        }
                        );
                      }
                      else{
                        Navigator.of(context).pop();
                      }
                    }
                  });
              },
            ),

          ],
        );
      },
    );
  }
}
