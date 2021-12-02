import 'package:flutter/material.dart';
import 'package:Facebook/blocs/auth/auth_events.dart';
import 'package:Facebook/blocs/auth/auth_states.dart';
import '../blocs/auth/auth_bloc.dart';
import '../strings/strings.dart';
import 'VerificationScreen.dart';


class Password extends StatelessWidget {
  String first_name, second_name, Birth, gender, email, phone;
  Password({this.first_name, this.second_name, this.Birth, this.gender, this.email, this.phone});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(first_name,second_name, Birth, gender, email, phone);
  }
}
class MyHomePage extends StatefulWidget {
  get initialValue => null;
  String first_name, second_name, Birth, gender, email, phone;
  @override
  _MyHomePageState createState() => _MyHomePageState();
  MyHomePage(this.first_name,this.second_name, this.Birth, this.gender, this.email, this.phone);
}

class _MyHomePageState extends State<MyHomePage> {
  AuthBloc _authBloc = AuthBloc();
  String password;
  bool showLoading = false;
  final GlobalKey<FormState> form_key = GlobalKey<FormState>();
  TextEditingController _textController;
  bool _wasEmpty;
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);
    _wasEmpty = _textController.text.isEmpty;
    _textController.addListener(() {
      if (_wasEmpty != _textController.text.isEmpty)
        setState(() => {_wasEmpty = _textController.text.isEmpty});});

    _authBloc.subject.listen((AuthState state) {
      if(state is  UserSignUp){
        setState(() {
          showLoading = false;
        });
      }
    });
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  bool _obscureText = true;
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  Widget bulidPassword() {
    return  TextFormField(
      decoration: InputDecoration(labelText: AppStrings.Password,
          suffixIcon: _textController.text.isNotEmpty ?
          IconButton(
            icon:Icon(_obscureText ? Icons.visibility_off : Icons.visibility,),
            onPressed: _togglePasswordStatus,
            color: Colors.black38,
          ) : null
      ),
          onChanged: (text){
            setState(() {
              //print(text);
            });
          },
          obscureText: _obscureText,
          controller: _textController,
          keyboardType: TextInputType.visiblePassword,
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
       resizeToAvoidBottomInset: false,
       appBar: AppBar(
       backgroundColor: Colors.white,
       iconTheme: IconThemeData(
       color: Colors.black,
   ),
    title: Text(
    AppStrings.Password,
    style: TextStyle(
    fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    ),
    body:Container(
     margin: EdgeInsets.all(24),
     child: Form(
       key: form_key,
       child: Column(
         children: <Widget>[
           SizedBox(height: 100),
           Text("Choose a " + AppStrings.Password,
               style: TextStyle(
                   fontSize: 20,
                   color: Colors.black,
                   fontWeight: FontWeight.bold)),
           SizedBox(height: 10),
           bulidPassword(),
           SizedBox(height: 100),
           Container(
               width: double.infinity,
               height: 45,
               child: RaisedButton(
                 color: Colors.blue,
                 highlightElevation: 30,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(5)),
                 child: Text(
                   'Sgin Up',
                   style: TextStyle(color: Colors.white, fontSize: 16),
                 ),
                 onPressed: ()  {
                   if (form_key.currentState.validate())
                     {
                       form_key.currentState.save();
                       _authBloc.dispatch(SignUpTapped(widget.first_name,widget.second_name,
                           widget.Birth,widget.gender,widget.phone,widget.email, password));
                       setState(() {
                         showLoading = true;
                       });
                       Future.delayed(const Duration(milliseconds: 5000),(){
                         setState(() {
                           Navigator.push(
                               context, MaterialPageRoute(builder: (_) => verification_email(Email:widget.email
                               ,password:password)));
                         });
                       });
                     }

                 },
               )),
           SizedBox(height: 10),
           showLoading ? CircularProgressIndicator() : Container(),
         ],
       ),
     ),
   ));
  }

}