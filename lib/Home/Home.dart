
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Facebook/logInScreen/loginscreen.dart';
import 'package:flutter_session/flutter_session.dart';
import 'Settings.dart';
import 'logoutSplash.dart';
class Home extends StatefulWidget {
  get initialValue => null;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<Home>{
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () async {
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
              ),
            ],

            title: Text(
              "Facebook",
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff0070ff),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w800),
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home ,color: Colors.black,),),
                Tab(icon: Icon(Icons.people_outline,color: Colors.black,)),
                Tab(icon: Icon(Icons.notifications_none,color: Colors.black,)),
                Tab(icon: Icon(Icons.menu,color: Colors.black,)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              bulidHome(),
              bulidFriends(),
              bulidNotification(),
              bulidMenu(),
            ],
          ),
        ),
      ),
    );
  }
  Widget bulidHome(){
    return  Container(
      child: Icon(Icons.home),
    );
  }
  Widget bulidFriends(){
    return  Container(
      child: Icon(Icons.home),
    );
  }
  Widget bulidNotification(){
    return  Container(
      child: Icon(Icons.home),
    );
  }
  Widget bulidMenu(){
    return  SingleChildScrollView(
                  child: Container(
                      height: 560,
                      child:Show(),
                         ));
  }

}
class Show extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Color(0xffDCDCDC),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () => {},
                      color: Color(0xffDCDCDC),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.help),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Help & Support",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 1,
                    ),
                    FlatButton(//******************Change Passward .. Editing profile*************
                      onPressed: () => {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => Settings()))
                      },
                      color: Color(0xffDCDCDC),
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.settings),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Setting & Privacy",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      height: 1,
                    ),
                    FlatButton(
                        onPressed: () => {showAlertDialog(context)},
                        color: Color(0xffDCDCDC),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.call_missed_outgoing),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Log out",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ))]),
            )],));
  }
  Future<AlertDialog> showAlertDialog(BuildContext context) {
    return showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                      "Are you sure you want to logout?",
                      style: TextStyle(
                          fontSize: 20, fontFamily: "Roboto", fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: ()
                 {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) =>logoutSplash())
                  );
                },
                child: Text("Log out",style: TextStyle(fontSize: 17),)),
            FlatButton(
                onPressed: () {
                  //Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) => Home())
                  );
                },
                child: Text("Cancel",style: TextStyle(fontSize: 17),)),
          ],
        );
      },
    );
  }
}
