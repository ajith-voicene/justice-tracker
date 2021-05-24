import 'package:device_info/device_info.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:justice_trackerr/complaint.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'signup_2.dart';
import 'urls.dart';
import 'Sign_up.dart';
import 'questionnaire.dart';

void main() => runApp(new MaterialApp(
  home: new signin_2(),
));

class signin_2 extends StatefulWidget {
  @override
  signin_2_State createState() {
    return new signin_2_State();
  }
}

class signin_2_State extends State<signin_2> {


  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String device_name;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool passwordVisible;
// ignore: missing_return
  Future<bool> _onBackPressed() {
    Navigator.pop(context);
  }
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(

        children: [

          CircularProgressIndicator(
            valueColor:AlwaysStoppedAnimation<Color>(Colors.cyan),
          ),

          Container(
              margin: EdgeInsets.only(left: 5), child: Text("Loading....")),

        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;

      },
    );

  }
  @override
  void initState() {
    passwordVisible = true;
    get_devicename();
    super.initState();
  }
  Future get_devicename() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"+
    setState(() {
      device_name =androidInfo.model;
      print(device_name);
    });
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running on ${iosInfo.utsname.machine}');

    setState(() {
      device_name =iosInfo.utsname.machine;
      print(device_name);
    });



  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/jt_background.png"),
                fit: BoxFit.cover,),
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 30.0,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    new Form(
                      key: _formKey,
                      child: FormUI(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => forgot_password()),
                            // );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.grey[800]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signup_2()),
                          );
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account yet?  ",
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.grey[800]),
                              ),
                              Text(
                                " Sign Up",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: Text(
                        "or sign in with",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: new Image.asset(
                            'images/jt_google.png',
                            height: 15.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        new Container(
                          child: new Image.asset(
                            'images/jt_fb.png',
                            height: 15.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        new Container(
                          child: new Image.asset(
                            'images/jt_tw.png',
                            height: 15.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  Widget FormUI() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Username",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              overflow: Overflow.visible,
              children: <Widget>[
                AutofillGroup(
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    autofillHints: [AutofillHints.email],
                    validator: validateEmail,
                    cursorColor: Colors.blue,
                    autocorrect: true,
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),

                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),

                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(Icons.mail, color: Colors.grey[800],),
                      hintStyle: new TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      // hintText: "Email ID",
                      labelStyle:
                      new TextStyle(color: Colors.black, fontSize: 15),

                      fillColor: Colors.grey[350],
                      isDense: true,
                      // Added this
                      contentPadding: EdgeInsets.all(4),
                    ),
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
              ]),
          SizedBox(
            height: 15.0,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Password",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          AutofillGroup(
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              // enableInteractiveSelection: false,
              obscureText: passwordVisible,
              autofillHints: [AutofillHints.password],
              cursorColor: Colors.blue,
              maxLines: 1,
              validator: (String arg) {
                if (arg.length < 3)
                  return 'Enter password';
                else
                  return null;
              },
              autocorrect: true,
              decoration: new InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),

                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),

                  ),
                ),
                filled: true,
                prefixIcon: Icon(Icons.lock, color: Colors.grey[800],),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[800],
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),

                hintStyle: new TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                // hintText: "Email ID",
                labelStyle:
                new TextStyle(color: Colors.black, fontSize: 15),

                fillColor: Colors.grey[350],
                isDense: true,
                // Added this
                contentPadding: EdgeInsets.all(4),
              ),
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            child: Form(
              child: RaisedButton(
                onPressed: () {
                  _validateInputs();
                },

                color: Colors.cyan,
                child:
                new Center(
                  child: new Text(
                    'Sign In',
                    style: new TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _validateInputs() {
    String username = _emailController.text;
    String password = _passwordController.text;
    print(username);
    print(password);
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables

      _formKey.currentState.save();
      showAlertDialog(context);
      fetchPost();
      print("success");
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
      print("failure");
    }
  }

  Future<String> fetchPost() async {
    print("device_name");
    print(device_name);
    // <------ CHANGED THIS LINE

    final response = await http.post(Login_url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({
          "email": _emailController.text,
          "password": _passwordController.text,
          "device_name":device_name
        }));
    print(response);
    print(_passwordController.text);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('EmailId', _emailController.text);
    prefs.setString('Password', _passwordController.text);
    Map<String, dynamic> responseJson = json.decode(response.body);
    print(responseJson);
    var message, success, token, user_type, name;
    message = responseJson["message"];
    success = responseJson["success"];
    name = responseJson["name"];
    token = responseJson["token"];
    prefs.setString('Token', token);
    print("token====");
    print(token);
    print(name);
    if (success == true) {
      prefs.setString('Name', responseJson['data']['name']);
      prefs.setString('EmailId', responseJson['data']['email']);
      prefs.setString('profile_photo_url', responseJson['data']['profile_photo_url']);
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14.0
      );

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) {
        return complaint();
      }));
    } else {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14.0
      );
      Navigator.of(context, rootNavigator: true).pop();
      throw Exception('Failed to load post');
    }
  }
}
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Registered Email';
  else
    return null;
}
