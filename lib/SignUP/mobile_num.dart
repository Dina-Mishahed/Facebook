import 'package:flutter/material.dart';
import '../strings/strings.dart';
import 'Email.dart';
import 'Password.dart';

class MobileNumber extends StatelessWidget {
  String first_name, second_name, Birth, gender;
      MobileNumber({this.first_name , this.second_name ,this.Birth ,this.gender});
  @override
  Widget build(BuildContext context) {
    return MyHomePage(first_name,second_name,Birth,gender);
  }
}

class MyHomePage extends StatefulWidget {
  get initialValue => null;
  String fname,lname,birthday,gender;
  @override
  _MyHomePageState createState() => _MyHomePageState();
  MyHomePage(this.fname,this.lname,this.birthday,this.gender);
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
  String phone_number = "";
  Widget bulidMobile() {
    return TextFormField(
      decoration: InputDecoration(labelText: AppStrings.Mobile_number,
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
      keyboardType: TextInputType.phone,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return AppStrings.Mobile_number + AppStrings.EmptyFelid;
        }
        try {
          var number = double.parse(value.trim());
        }catch(e)
        {
          return AppStrings.invalid + AppStrings.Mobile_number;
        }
        return null;
      },
      onSaved: (String value) {
        phone_number = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: AppBar(
         backgroundColor: Colors.white,
         iconTheme: IconThemeData(
           color: Colors.black,
         ),
         title: Text(
           AppStrings.Mobile_number,
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
               Text(AppStrings.Enter + AppStrings.Mobile_number,
                   style: TextStyle(
                       fontSize: 20,
                       color: Colors.black,
                       fontWeight: FontWeight.bold)),
               SizedBox(height: 10),
               bulidMobile(),
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
                       style: TextStyle(color: Colors.white, fontSize: 16),
                     ),
                     onPressed: () {
                       if (form_key.currentState.validate())
                         {
                           form_key.currentState.save();
                           // print(" " + widget.fname + " " + widget.lname+ " " +
                           //     widget.birthday+ " " + widget.gender+ " " +phone_number);
                           Navigator.of(context).push(
                               MaterialPageRoute(builder: (context)=>Password(first_name: widget.fname,
                                 second_name: widget.lname,Birth: widget.birthday,
                                   gender: widget.gender,email:"",phone: phone_number)
                               )
                           );
                           //firs
                         }
                     },
                   )),
               Spacer(),
               GestureDetector(
                 onTap: () {
                   child:
                   Navigator.of(context)
                       .push(MaterialPageRoute(builder: (context) => Email(first_name: widget.fname,
                     second_name: widget.lname,Birth: widget.birthday,gender: widget.gender,)));
                 },
                 child: Text(AppStrings.SignUPWith + AppStrings.emailAddress,
                     style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                         color: Colors.blue)),
               )
             ],
           ),
         ),
       )
   );
  }

}
