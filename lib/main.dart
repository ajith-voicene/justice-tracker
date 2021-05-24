// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Homepage.dart';
import 'sign_in.dart';


void main() async {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>{
  startTime()  {
    var _duration = new Duration(seconds: 3);

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

            new Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Image(
                      image: AssetImage('images/logo.png'),height: 100,
                    ),

                  ],
                )
            ),

          ],
        )
    );
  }
}





