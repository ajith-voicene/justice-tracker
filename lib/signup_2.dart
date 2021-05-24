
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'Homepage.dart';
import 'sign_in.dart';
import 'signin_2.dart';
import 'urls.dart';

void main() => runApp(new MaterialApp(
  home: new signup_2(),
));

class signup_2 extends StatefulWidget {
  @override
  signup_2_State createState() {
    return new signup_2_State();
  }
}

class signup_2_State extends State<signup_2> {

  final _usernamecntrl = TextEditingController();
  final _namecntrl = TextEditingController();
  final _passwordController2 = TextEditingController();
  final _passwordController = TextEditingController();
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showTooltip = false;
  bool _autoValidate = false;
  bool passwordVisible;
  bool passwordVisible2;
  bool _agreedToTOS = false;

  @override
  void initState() {
    passwordVisible = true;
    passwordVisible2 = true;
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
                      height: 40,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 30.0, color: Colors.grey[800],fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Form(
                      key: _formKey,
                      child: FormUI(),
                    ),


                    SizedBox(
                      height: 30,
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
                      height: 10,
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
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Name",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              overflow: Overflow.visible,
              children: <Widget>[
                TextFormField(
                  controller: _namecntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter Name';
                    else
                      return null;
                  },
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
                    prefixIcon: Icon(Icons.person, color: Colors.grey[800],),
                    hintStyle: new TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    // hintText: "Email ID",
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "User Name",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              overflow: Overflow.visible,
              children: <Widget>[
                TextFormField(
                  controller: _usernamecntrl,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,

                  validator:validateEmail,
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
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 8.0,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Password",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordController,
            obscureText: passwordVisible,
            cursorColor: Colors.blue,
            maxLines: 1,
            // enableInteractiveSelection: false,
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
              prefixIcon: Icon(Icons.lock, color: Colors.grey[800],),  suffixIcon: IconButton(
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
              isDense: true,                      // Added this
              contentPadding: EdgeInsets.all(4),
            ),
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            height: 8.0,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Confirm Password",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordController2,
            obscureText: passwordVisible2,
            cursorColor: Colors.blue,
            // enableInteractiveSelection: false,
            maxLines: 1,
            validator: (String arg) {
              if (arg.length < 3)
                return 'Enter Confirm password';
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
              prefixIcon: Icon(Icons.lock, color: Colors.grey[800],),  suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible2 ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[800],
              ),
              onPressed: () {
                setState(() {
                  passwordVisible2 = !passwordVisible2;
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
              isDense: true,                      // Added this
              contentPadding: EdgeInsets.all(4),
            ),
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  focusColor: Colors.white,
                  activeColor: Colors.cyan,
                  value: _agreedToTOS,
                  onChanged: _setAgreedToTOS,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _setAgreedToTOS(!_agreedToTOS);
                    });
                  },
//                                  () => _setAgreedToTOS(!_agreedToTOS),
                  child: Row(
                    children: [
                      const Text(
                        'Agree to ',
                        style: TextStyle(fontSize: 16, color: Colors.cyan),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.cyan),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => signin_2()),
              );
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?  ",
                    style: TextStyle(
                        fontSize: 16.0, color: Colors.grey[800]),
                  ),
                  Text(
                    " Login",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan),
                  ),
                ]),
          ),

          SizedBox(
            height: 10.0,
          ),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            child: Form(
              child: RaisedButton(
                onPressed:(){

                  _validateInputs();
                },
                color: Colors.cyan,
                child: new Center(
                  child: new Text(
                    'Sign Up',
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
    if(_passwordController.text!=_passwordController2.text){
      Fluttertoast.showToast(
          msg:"Please check the password",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14.0
      );
    }
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables

      _formKey.currentState.save();
      if( _agreedToTOS==true) {

        showAlertDialog(context);
        fetchPost();
      }else{
        Fluttertoast.showToast(
            msg:"please select Terms and Services",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 14.0
        );
      }
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
    // <------ CHANGED THIS LINE

    final response = await http.post(register_url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({
          "name":_namecntrl.text,
          "email": _usernamecntrl.text,
          "password": _passwordController.text,
          "password_confirmation":_passwordController2.text
        }));
    print(response);
    print(_passwordController.text);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> responseJson = json.decode(response.body);
    print(responseJson);
    var message, success, user_type, name;
    message = responseJson["message"];
    success = responseJson["success"];
    name = responseJson["name"];

    prefs.setString('Name', name);
    print(name);
    print(user_type);
    if (success == true) {
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
        return sign_in();
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
  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
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
