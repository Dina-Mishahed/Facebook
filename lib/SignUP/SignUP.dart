import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Facebook/blocs/auth/auth_states.dart';
import '../blocs/auth/auth_bloc.dart';
import '../strings/strings.dart';
import 'Birthday.dart';
class SignUP extends StatefulWidget {
  get initialValue => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignUP> {
  final GlobalKey<FormState> form_key = GlobalKey<FormState>();
  String first_name;
  String second_name;
  TextEditingController _textController;
  TextEditingController _textController2;
  bool _wasEmpty;

  AuthBloc _authBloc = AuthBloc();
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);
    _wasEmpty = _textController.text.isEmpty;
    _textController2 = TextEditingController(text: widget.initialValue);
    _wasEmpty = _textController2.text.isEmpty;
    _textController.addListener(() {
      if (_wasEmpty != _textController.text.isEmpty)
        setState(() => {_wasEmpty = _textController.text.isEmpty});
      if (_wasEmpty != _textController2.text.isEmpty)
        setState(() => {_wasEmpty = _textController2.text.isEmpty});
    });
    _authBloc.subject.listen((AuthState state) {
      if(state is UserSignUp){
        setState(() {

        });
      }
    });
  }
  @override
  void dispose() {
    _textController.dispose();
    _textController2.dispose();
    super.dispose();
  }
  Widget bulidFirstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: AppStrings.fisrt_name,
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
      onChanged: (text){
        setState(() {});
      },
      controller: _textController,

      style: TextStyle(fontSize: 20,fontFamily: "Roboto",),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.fisrt_name + AppStrings.EmptyFelid;
        }
        else if (value.length < 3){
          return "second name is short";
        }
        return null;
      },
      onSaved: (String value) {
        first_name = value.trim();
      },
    );
  }

  Widget bulidSecondName() {
    return TextFormField(
      decoration: InputDecoration(labelText: AppStrings.last_name,
          suffixIcon: _textController2.text.isNotEmpty
              ? new IconButton(
            iconSize: 22,

            icon: Icon(Icons.clear,color: Colors.grey,),
            onPressed: (){
              setState(() {
                _textController2.clear();
              });
            },

          ) : null
      ),onChanged: (text){
      setState(() {});
    },
      controller: _textController2,
      style: TextStyle(fontSize: 20,fontFamily: "Roboto",),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.last_name + AppStrings.EmptyFelid;
        }
        else if (value.length < 3){
          return "second name is short";
        }
        return null;
      },
      onSaved: (String value) {
        second_name = value.trim();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            "Name",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: "Roboto"),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: form_key,
            child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Text(AppStrings.Q + AppStrings.name +"?",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700)),
            SizedBox(height: 10),
            Row(children: <Widget>[
              Expanded(child: bulidFirstName()),
              //Expanded(child:  SizedBox(width:1)),
              SizedBox(width: 10),
              Expanded(child: bulidSecondName()),
            ]),
            SizedBox(height: 100),
            Builder(
                builder: (context) => Center(
                    child: Container(
                        width: double.infinity,
                        height: 45,
                        child: RaisedButton(
                          color: Colors.blue,
                          highlightElevation: 30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16,fontFamily: "Roboto"),
                          ),
                          onPressed: () {
                            if (form_key.currentState.validate()) {
                              form_key.currentState.save();
                              Navigator.of(context)
                                    .push(MaterialPageRoute(
                                builder: (context) => Birthday (first_name : first_name , second_name :second_name),
                              ));
                            }
                          },
                        ))))
          ],
        ),
      ),
      ));
  }
}
