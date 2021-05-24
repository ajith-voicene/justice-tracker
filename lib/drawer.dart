import 'dart:convert';
import 'dart:io';
import 'package:justice_trackerr/complaint.dart';
import 'package:justice_trackerr/directory_list.dart';
import 'package:justice_trackerr/questionnaire.dart';

import 'History.dart';
import 'Sign_up.dart';
import 'urls.dart';
import 'profile.dart';
import 'summary.dart';
import 'emergency.dart';
import 'call.dart';
import 'create_campaign.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'Homepage.dart';
BuildContext context;
class navigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Drawer(

      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.85,
//                      height: 250,
              child: DrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.cover)),

                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 30.0,
                      left: 16.0,
                      child: Text(
                        " ",
                        style:
                        TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: [
                  ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.home,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Home",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () {


                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homepages()),
                          );





                    },
                  ),
                  ListTile(

                    dense: true,
                    leading: new Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Profile",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return profile();
                      }));
                    },
                  ),
                  ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.call,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Call",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return call();
                      }));
                    },
                  ),
                  ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.history,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("History",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return History();
                      }));
                    },
                  ),
                  ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.campaign,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Create Campaign",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.4, 0),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return create_campaign();
                      }));
                    },
                  ),
                  ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.question_answer,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Questionnaire",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () {


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => questionnaire()),
                      );
                      },
                  ),
                  ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.error_outline,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Complaint",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () {


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => complaint()),
                      );
                      },
                  ),
                  ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Logout",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: ()  async {
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

                        print('RETURNING: ' + response.body);
                        Fluttertoast.showToast(
                            msg:message,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 14.0
                        );
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Homepages();
                        }));
                        prefs.setString("Token",null);

                      } else { prefs.setString("Token",null);

                        Fluttertoast.showToast(
                            msg:message,
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 14.0
                        );

                        throw Exception('Failed to load post');

                      }

                    },
                  )

                ]

            ),
          )
        ],
      ),
    );
  }

  Future<String> logout() async { // <------ CHANGED THIS LINE


  }
}

class outsideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.85,
//                      height: 250,
              child: DrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.cover)),

                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 30.0,
                      left: 16.0,
                      child: Text(
                        " ",
                        style:
                        TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
                padding: EdgeInsets.only(top: 0),
                children: [
                  ListTile(

                    dense: true,
                    leading: new Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("New User",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Sign_up();
                      }));
                    },
                  ),
                  ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.store_mall_directory,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Directory",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () {


                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => directory_list()),
                      );
                      },
                  ),
                   ListTile(
                    dense: true,
                    leading: new Icon(
                      Icons.error,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: Align(
                      child: new Text("Emergency",
                        style: TextStyle(fontSize: 15,
                            color: Colors.black),
                      ),
                      alignment: Alignment(-1.2, 0),
                    ),
                    onTap: () async {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return emergency();
                      }));
                    },
                  )

                ]

            ),
          )
        ],
      ),
    );
  }
}
