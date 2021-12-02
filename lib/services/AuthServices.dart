
import 'package:Facebook/PODO/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_logger/http_logger.dart';
import 'package:Facebook/SignUP/SignUP.dart';
import 'package:http_middleware/http_middleware.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices{
  SiginUp(String firstName ,String lastName ,String birhtday,
      String gender,String Phone, String Email,String pass)async{
    var g;
    if(gender == 'Female') g = '0';
    else if( gender == 'Male') g = '1';
    String Email_or_Phone = Phone + Email;
    http.Response response = await http.post("http://team4-cscamp.tk/api/auth/users"
        ,body:{
          'first_name': firstName,
          'last_name': lastName,
          'birthdate' : birhtday,
          'gender' : g,
          'email' : Email_or_Phone,
          'password' : pass,
        });
    print(response.body);
    Map<String,dynamic> result = json.decode(response.body);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("Token", result['access_token']);
  }
  Future<String> Login(String Email_or_phone ,String password)async{
    var match ={
      "email" : '$Email_or_phone' ,
      "password" : '$password'};
    HttpWithMiddleware httpuser =HttpWithMiddleware.build(middlewares: [HttpLogger(logLevel: LogLevel.BODY),]);
   var response = await httpuser.post("http://team4-cscamp.tk/api/auth/login" ,
       body:json.encode(match),
       headers: {"Content-Type": "application/json",
         "Accept": "application/json",
         "charset":"utf-8"});
   try{
     Map<String,dynamic> result = json.decode(response.body);
     if(result['access_token'] != null)
       {
         final prefs = await SharedPreferences.getInstance();
         prefs.setString("Token", result['access_token']);
         return "success";
       }
     else if(result['success'] == "false"){
       return result["error"];
     }
   }
   catch(Exception){
     // var session = FlutterSession();
     // await session.set("Token", "null");
     return "Please check your email inbox for verification email";
   }
  }
  Future<String> Logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('Token') ?? null;
    print("token= " + token);
    HttpWithMiddleware httpuser1 = HttpWithMiddleware.build(
        middlewares: [HttpLogger(logLevel: LogLevel.BODY),]);
    var response = await httpuser1.post(
        "http://team4-cscamp.tk/api/auth/logout",
        headers: {"Content-Type": "application/json",
          "Accept": "application/json",
          "charset": "utf-8",
    'Authorization': 'Bearer $token'});
    print("//////////////////////////////here-response.body/////////////////////");
    Map<String, dynamic> result = json.decode(response.body);
    print(result['message']);
    return "success";
  }

  Future<String>  ForgetPassword(String Email) async {
    HttpWithMiddleware httpuser =HttpWithMiddleware.build(middlewares: [HttpLogger(logLevel: LogLevel.BODY),]);
    try{
      var response = await httpuser.post("http://team4-cscamp.tk/api/forgetPassword" ,
          body:json.encode({'email' : '$Email',}),
          headers: {"Content-Type": "application/json",
            "Accept": "application/json",
            "charset":"utf-8"});
      Map<String,dynamic> result = json.decode(response.body.toString());
      print(result["message"]);
      return  "true";
    }
    catch(Exception){
      print(Exception);
      return "false";
    }

  }

  Future<bool>  Code_ForgetPassword(String Email,int Code) async {
    HttpWithMiddleware httpuser =HttpWithMiddleware.build(middlewares: [HttpLogger(logLevel: LogLevel.BODY),]);
    var response = await httpuser.post("http://team4-cscamp.tk/api/ConfirmPIN" ,
        body:json.encode({'email' : '$Email','Code':'$Code'}),
        headers: {"Content-Type": "application/json",
          "Accept": "application/json",
          "charset":"utf-8"});
    try{
    Map<String,dynamic> result = json.decode(response.body.toString());
    print(response.body);
    print(result['success']);
    return result["success"];
    // if (result["success"] == 'true') return "true";
    // else if (result["success"] == 'false') return "inValid PIN";
    // else{return 'false';}
    }
    catch(Exception){
      print(response.body);
      print(Exception);
      return false;
    }
  }

  Future<String>  FinishResetPassword(String Email,int Code, String Password) async {
    HttpWithMiddleware httpuser = HttpWithMiddleware.build(
        middlewares: [HttpLogger(logLevel: LogLevel.BODY),]);
    var response = await httpuser.post("http://team4-cscamp.tk/api/RestPass",
        body: json.encode(
            {'email': '$Email', 'Code': '$Code', 'password': '$Password'}),
        headers: {"Content-Type": "application/json",
          "Accept": "application/json",
          "charset": "utf-8"});
    try {
      Map<String, dynamic> result = json.decode(response.body.toString());
      print(response.body);
       print(result);
       return "true";
    }
    catch (Exception) {
      print(response.body);
      print(Exception);
      return "false";
    }
  }
}
