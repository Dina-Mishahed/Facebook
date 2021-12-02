import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../strings/strings.dart';
import 'Gender.dart';
import 'Gender.dart' as globals;
class Birthday extends StatelessWidget {
   String first_name;
   String second_name;
  Birthday({this.first_name,this.second_name});

  @override
  Widget build(BuildContext context) {
    return DatePicker(first_name,second_name);
  }
}

class DatePicker extends StatefulWidget {
  String fname,lname;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _DatePicker();
  }
  DatePicker(this.fname,this.lname);
}

class _DatePicker extends State<DatePicker> {
  DateTime birthday = DateTime(2019, 1, 1);
  @override
  Widget build(BuildContext context) {
    //DateTime _dateTime = DateTime.now();
    DateTime _dateTime = DateTime(2019, 1, 1);
    // TODO: implement build
    //throw UnimplementedError();
    return

      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            AppStrings.Birthday ,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,fontFamily: "Roboto"),
          ),
        ),

        body: SafeArea(
                child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
              child: Column(
              children:<Widget>[
              SizedBox(height: 90),
              Text(
              AppStrings.Q + AppStrings.Birthday +"?",
              style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700)
              ),
              SizedBox(height: 30),
              SizedBox(height: 150, width: 300, child: CupertinoDatePicker(initialDateTime: _dateTime,
              //use24hFormat: true,
                mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (newDateTime) {
              setState(() {birthday = newDateTime;
                });},
                ),),
              //Error
              Padding(padding: EdgeInsets.all(16.0),),
              SizedBox(height: 5),
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
              print(widget.fname+ "  "+ widget.lname+"  "+"   " +birthday.toString()),
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>Gender(first_name :widget.fname  ,
              second_name : widget.lname ,birthday : birthday.toString() ))),},
              ),),
              ],
              ),
                ),),),
      );
  }
}
