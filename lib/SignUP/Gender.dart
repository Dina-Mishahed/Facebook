//import 'package:flutter/animation.dart';
import 'package:Facebook/SignUP/Email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../strings/strings.dart';
import 'mobile_num.dart';

// ignore: must_be_immutable
class Gender extends StatelessWidget {
  String first_name, second_name, birthday;
  Gender({this.first_name,this.second_name,this.birthday});
  @override
  Widget build(BuildContext context) {
    return state(first_name,second_name,birthday);
  }
}

class state extends StatefulWidget {
  String fname,lname,birth;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _state();
  }
  state(this.fname,this.lname,this.birth);
}

class _state extends State<state> {
  int _value = 1;
  String gender = 'Female';
  @override
  void radioButtonChanges(int value) {
    setState(() {
      _value = value;
      switch (value) {
        case 1:
          _value = value;
          gender ='Female';
          break;
        case 2:
          _value = value;
          gender ='Male';
          break;
        case 3:
          _value = value;
          gender ='Custom';
          break;
      // default:
      //   choice = null;
      } //Debug the choice in console
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          AppStrings.Gender,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: "Roboto"),
        ),
      ),
      body: Container(

        child:SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              /* Container(
            //margin: EdgeInsets.all(24),
              child: Expanded(
                  child: Column(children:
                      */
              children:<Widget>[
                //    SingleChildScrollView(
                SizedBox(height: 50),
                Text(
                  AppStrings.Q + AppStrings.gender + "?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25, left: 25, top: 8),
                  child: Text(
                    "You con change who sees your gender on your profile later",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  title:
                  Text('Female', style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: radioButtonChanges,
                  ),
                  onTap: () {
                    radioButtonChanges(1);
                  },
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: Colors.black),
                ),
                ListTile(
                  title: Text('Male', style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: radioButtonChanges,
                  ),
                  onTap: () {
                    radioButtonChanges(2);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: Colors.black),
                ),
                ListTile(
                  title:
                  Text('Custom', style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: radioButtonChanges,
                  ),
                  onTap: () {
                    radioButtonChanges(3);
                  },
                ),
                Visibility(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10, left: 15, top: 2, bottom: 10),
                    child: Text(
                      "Select Custom to choose another gender, or if you`d rather not say.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                      ),
                      //textAlign: TextAlign.center,
                    ),
                  ),
                  visible: _value == 3 ? false : true,
                ),
                Visibility(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  ),
                  visible: _value == 3 ? true : false,
                ),
                ////////may Error
                Visibility(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 30),
                    child: RaisedButton(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.white24,
                            padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                            child: Text(
                              'Select your pronoun',
                              style: TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(60, 0, 0, 5),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      textColor: Colors.indigoAccent,
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 10),
                      //icon: Icon(Icons.keyboard_arrow_down, size: 30,),
                      //label: Text("Select your pronoun" ,style: TextStyle(fontSize: 20,),),
                      //splashColor: Colors.red,
                      //color: Colors.green,),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0)),
                            ),
                            builder: (context) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: Text('She'),
                                    onTap: () {
                                      print('Send email');
                                    },
                                    subtitle: Text("\"Wish her a happy birthday!\""),
                                  ),
                                  ListTile(
                                    title: Text('He'),
                                    onTap: () {
                                      print('Call phone');
                                    },
                                    subtitle: Text("\"Wish him a happy birthday!\""),
                                  ),
                                  ListTile(
                                    title: Text('They'),
                                    onTap: () {
                                      print('Call phone');
                                    },
                                    subtitle: Text("\"Wish them a happy birthday!\""),
                                  ),
                                ],
                              );
                            });
                      },
                      //shape: ShapeBorder(),
                    ),
                  ),
                  visible: _value == 3 ? true : false,
                ),
                Visibility(
                  child: Padding(
                    child: TextField(
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                      onSubmitted: (String userInput) {
                        setState(() {});
                      },
                      decoration: new InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        hintText: 'Enter your gender (optional)',
                      ),
                    ),
                    padding: EdgeInsets.only(left: 20, right: 30),
                  ),
                  visible: _value == 3 ? true : false,
                ),
                Visibility(
                  child: Padding(
                    padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                    child: Text(
                      "Your pronoun is visible to everyone.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  visible: _value == 3 ? true : false,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: Colors.black),
                ),

                Padding(padding: EdgeInsets.all(16.0),),
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
                      'Next',
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>Email(first_name: widget.fname,
                            second_name: widget.lname,Birth: widget.birth,gender: gender,)
                          )
                      ),
                      //first_name : first_name ,
                    },
                  ),
                ),
                //down code

              ],
            ),
          ),
        ),
      ),
    );
  }
}
