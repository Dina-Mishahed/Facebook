import 'package:flutter/material.dart';
import '../strings/strings.dart';
import 'mobile_num.dart';
import 'Password.dart';
class Email extends StatelessWidget{
  String first_name, second_name, Birth, gender;
  Email({this.first_name, this.second_name, this.Birth, this.gender});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(first_name,second_name, Birth, gender);
  }
}
class MyHomePage extends StatefulWidget {
  get initialValue => null;
  String first_name, second_name, Birth, gender;
  @override
  _MyHomePageState createState() => _MyHomePageState();
  MyHomePage(this.first_name,this.second_name, this.Birth, this.gender);
}

class _MyHomePageState extends State<MyHomePage> {
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
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  String email = "";
  Widget bulidEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: AppStrings.emailAddress ,
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
        setState(() {
          //print(text);
        });
      },
      controller: _textController,
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
       resizeToAvoidBottomInset: false,
       appBar: AppBar(
         backgroundColor: Colors.white,
         iconTheme: IconThemeData(
           color: Colors.black,
         ),
         title: Text(
           AppStrings.emailAddress,
           style: TextStyle(
               fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
         ),
       ),
       body:Container(
       margin: EdgeInsets.all(24),
       child: Form(
           key: form_key,
               child: Column(children: <Widget>[
                 SizedBox(height: 100),
                 Text(AppStrings.Enter + AppStrings.emailAddress,
                     style: TextStyle(
                         fontSize: 20,
                         color: Colors.black,
                         fontWeight: FontWeight.bold)),
                 SizedBox(height: 10),
                 bulidEmail(),
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
                         'Next',
                         style:
                         TextStyle(color: Colors.white, fontSize: 16),
                       ),
                       onPressed: () => {
                         if (form_key.currentState.validate())
                           {form_key.currentState.save(),
                             Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context) =>Password(first_name: widget.first_name,
                                 second_name: widget.second_name, Birth: widget.Birth,gender: widget.gender,
                                 email: email,phone: "",)))
                           }
                       },
                     )),
                 Spacer(),
                 GestureDetector(
                   onTap: () {
                     child:
                     Navigator.of(context).push(MaterialPageRoute(
                         builder: (context) => MobileNumber(first_name: widget.first_name,
                           second_name: widget.second_name,Birth: widget.Birth,
                           gender: widget.gender,)));
                   },
                   child: Text(
                       AppStrings.SignUPWith + AppStrings.Mobile_number,
                       style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: Colors.blue)),
                 )
               ]))));
  }

}
