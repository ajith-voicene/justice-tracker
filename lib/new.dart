// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Homepage.dart';
import 'sign_in.dart';


void main() async {
  runApp(new MaterialApp(
    home: new new_screen(),
    debugShowCheckedModeBanner: false,
  ));
}



class new_screen extends StatefulWidget {
  @override
  _new_screenState createState() => new _new_screenState();
}


class _new_screenState extends State<new_screen>{
  startTime()  {
    var _duration = new Duration(seconds: 0);

    return new Timer(_duration, navigationPage);

  }


  Future<void> navigationPage() async {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Homepages()),
    );

  }


  @override
  void initState(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.cyan, // Color for Android
        statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
    ));
    super.initState();

    startTime();

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[

          ],
        )
    );
  }
}





