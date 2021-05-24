import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customAppBar.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'questionnaire2.dart';
import 'urls.dart';

void main() => runApp( new MaterialApp(
home: new questionnaire()));


// ignore: camel_case_types
class questionnaire extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<questionnaire> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                  children: [
                    Icon(
                      Icons.warning, color: Colors.red, size: 20,
                    ), Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      child: new Text('Logout Application?'),
                    )
                  ]),
              content: new Text('Are you sure, Do you want to Logout the application?'),
              actions: <Widget>[
                new GestureDetector(
                  child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pop(),
                      child: Text(
                        "NO",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )),
                ),
                SizedBox(height: 16, width: 15,),
                new GestureDetector(
                  child: InkWell(
                      onTap: () async {
                        logout();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "YES",
                          style: TextStyle(
                              fontSize: 15, color: Colors.blue[900]),
                        ),
                      )),
                ),
              ],
            );
          }
      ).then((value) => value ?? false),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            child: ClipPath(
              clipper: CustomAppBar(),
              child: Container(color: Colors.cyan, child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: <Widget>[
                  Builder(
                    builder: (context) =>Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){
                              Scaffold.of(context).openDrawer();
                            },
                            child:
                            new Image.asset(
                              'images/menu.png',
                              height: 25.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text('Questionnaire', style: TextStyle(color: Colors.white, fontSize: 25),),
                          InkWell(
                            onTap: (){
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return questionnaire2();
                              }));
                            },
                            child:
                            new Icon(
                              Icons.add_circle,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ]),
                  ),
                ],),),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight + 50)),
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('Questionnaire', style: TextStyle(color: Colors.white, fontSize: 16),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_right, color: Colors.white,size: 20,),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('Questionnaire', style: TextStyle(color: Colors.white, fontSize: 16),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_right, color: Colors.white,size: 20,),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text('Questionnaire', style: TextStyle(color: Colors.white, fontSize: 16),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_right, color: Colors.white,size: 20,),
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
        drawer: navigationDrawer(),
      ),
    );
  }
  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("Token");
    print("token123");
    print(token);
    final response = await http.get(
      logout_url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    Map<String, dynamic> responseJson = json.decode(response.body);
    print(responseJson);
    var message,success;
    message = responseJson["message"];
    success = responseJson["success"];
    if (success == true) {
      if (Platform.isAndroid) {
        Fluttertoast.showToast(
            msg:message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 14.0
        );
         SystemNavigator.pop();
      } else if (Platform.isIOS) {
        Fluttertoast.showToast(
            msg:message,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 14.0
        );
        exit(0);
      }
      print('RETURNING: ' + response.body);
      prefs.setString("Token",null);
    } else { prefs.setString("Token",null);
    throw Exception('Failed to load post');
    }
  }
}

