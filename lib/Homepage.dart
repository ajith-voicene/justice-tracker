import 'dart:convert';
import 'dart:io';
import 'package:justice_trackerr/ad_description.dart';
import 'package:justice_trackerr/signup_2.dart';
import 'package:thumbnails/thumbnails.dart';

import 'drawer.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'Sign_up.dart';
import 'complaint.dart';
import 'customAppBar.dart';
import 'package:flutter/material.dart';
import 'emergency.dart';
import 'urls.dart';
import 'videoplayerpage.dart';
class profiles {
  final String success;
  final String message;
  final String ads;
  final List<Data> data;
  profiles({this.success, this.message, this.ads, this.data});
  factory profiles.fromJson(Map<String, dynamic> parsedJson) {
    return profiles(
      success: parsedJson['success'],
      message: parsedJson['message'],
      ads: parsedJson['ads'],
      data: parsedJson['ads']['data'],
    );
  }
}

class my_video {
  final String success;
  final String message;
  final String videos;
  final List<Video> data;
  my_video({this.success, this.message, this.videos, this.data});
  factory my_video.fromJson(Map<String, dynamic> parsedJson) {
    return my_video(
      success: parsedJson['success'],
      message: parsedJson['message'],
      videos: parsedJson['videos'],
      data: parsedJson['videos']['data'],
    );
  }
}

class Data {
  final String title;
  final String description;
  final String image_url;
  final int id;

  Data({this.id, this.description, this.title,this.image_url});
  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      id: parsedJson['id'],
      title: parsedJson['title'],
      description: parsedJson['description'],
        image_url:parsedJson['image_url'],
    );
  }
}

class Video {
  final String video_url;
  final String title;
  final int id;

  Video({this.id, this.video_url,this.title});
  factory Video.fromJson(Map<String, dynamic> parsedJson) {
    return Video(
      id: parsedJson['id'],
      video_url: parsedJson['video_url'],
        title:parsedJson['title'],
    );
  }
}

void main() => runApp(new MaterialApp(
  home: new Homepages(),
));
VideoPlayerController _videoPlayerController;
class Homepages extends StatefulWidget {
  Homepages({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomepagesState createState() => new _HomepagesState();
}
class _HomepagesState extends State<Homepages> {
String Token;
  ChewieController _chewieController;
  double _aspectRatio = 16 / 8;

  @override
  void initState() {
    getnames();
    super.initState();
    // _chewieController = ChewieController(
    //   videoPlayerController: _videoPlayerController,
    //   aspectRatio:16/8,
    //   autoInitialize: true,
    //   autoPlay:false,
    //   looping: true,
    //   errorBuilder: (context, errorMessage) {
    //     return Center(
    //       child: Text(
    //         errorMessage,
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     );
    //   },
    // );
  }

  Future<bool> _onWillPop()  {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }

  }
  Future getnames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Token = prefs.getString('Token');
    setState(() {
      Token=Token;
    });
    print("njjjnnnnnj");
    print(Token);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
            child: ClipPath(
              clipper: CustomAppBar(),
              child: Container(
                color: Colors.cyan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Builder(
                      builder: (context) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: new Image.asset(
                                'images/menu.png',
                                height: 25.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              'Justice Tracker',
                              style:
                              TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Text(" "),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight + 50)),
        body: Stack(
          children: <Widget>[
            ListView(
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "Latest News",
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.grey[800]),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: FutureBuilder<List<Video>>(
                            future: get_videos(),
                            builder: (ctx, snapshot) {
                              if (snapshot.hasData) {
                                List data = snapshot.data;
                                print("111111");
                                print(data);
                                return Container(
                                  height: 200,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        var item = snapshot.data[index];


                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                                  prefs.setString('Video_Url', snapshot
                                                      .data[index]
                                                      .video_url);
                                                  print("vvvvvvv");
                                                  print( snapshot
                                                      .data[index]
                                                      .video_url);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChewieDemo()),
                                                  );
                                                },
                                                child: Column(

                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      width: 230,
                                                      child: Card(
                                                        key: new PageStorageKey(snapshot.data[index].video_url),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                              topRight:
                                                              Radius.circular(
                                                                  10),
                                                              bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                              topLeft:
                                                              Radius.circular(
                                                                  10)),
                                                        ),
                                                        child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                            child: Stack(children: [
                                                              Container(
                                                                decoration: new BoxDecoration(
                                                                  image: new DecorationImage(
                                                                    image: new AssetImage("images/thumbb.jpg"),
                                                                    fit: BoxFit.cover,),
                                                                ),
                                                              ),
                                                              // Chewie(
                                                              //   key: new PageStorageKey(snapshot.data[index].video_url),
                                                              //   controller: _chewieController,
                                                              // ),
                                                            ])),
                                                      ),
                                                    ),
                                                    Expanded(child: Text(snapshot.data[index].title,style: TextStyle(fontSize: 15,color: Colors.black),)),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        );
                                      }),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    "Please try again later..",
                                    // 'Please try again later',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              }
                              // By default, show a loading spinner.
                              return Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.cyan),
                                    ),
                                    SizedBox(width: 20),
                                    // Text('Loading....')
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            "Ads",
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.grey[800]),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FutureBuilder<List<Data>>(
                          future: get_ads(),
                          builder: (ctx, snapshot) {
                            if (snapshot.hasData) {
                              List data = snapshot.data;
                              print(data);
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var item = snapshot.data[index];
                                    print(snapshot.data[index].image_url);
                                    return InkWell(
                                      onTap: () async {
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        prefs.setString('Ad_Title', snapshot
                                            .data[index]
                                            .title);
                                        prefs.setString('Ad_Description', snapshot
                                                      .data[index]
                                                      .description);
                                        prefs.setString('Ad_Image', snapshot
                                            .data[index]
                                            .image_url);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ad_description()),
                                        );
                                      },
                                      child: Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft:
                                                Radius.circular(10),
                                                topLeft: Radius.circular(10)),
                                          ),
                                          child: Container(
                                            child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  new Container(
                                                    height: 100,
                                                    decoration:
                                                    new BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .all(Radius
                                                            .circular(
                                                            10.0)),
                                                        image:
                                                        new DecorationImage(
                                                          image: NetworkImage(
                                                             snapshot.data[index].image_url),
                                                          fit: BoxFit
                                                              .cover,
                                                        )),
                                                    width: 120,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                15,
                                                                10,
                                                                0,
                                                                0),
                                                            child: Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .title.substring(
                                                                  0, 30)+"..",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  15,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                15,
                                                                10,
                                                                0,
                                                                5),
                                                            child: Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .description
                                                                  .substring(
                                                                  0, 100)+"...",
                                                              style:
                                                              TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey[
                                                                800],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        0, 35, 5, 10),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_sharp,
                                                      color: Colors.grey[800],
                                                      size: 20,
                                                    ),
                                                  ),
                                                ]),
                                          )),
                                    );
                                  });
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  "Please try again later..",
                                  // 'Please try again later',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }
                            // By default, show a loading spinner.
                            return Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.cyan),
                                  ),
                                  SizedBox(width: 20),
                                  // Text('Loading....')
                                ],
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            10.0)),
                                    color: Colors.red,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                emergency()),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        new Icon(
                                          Icons.error,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        Text(
                                          "Emergency",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // ignore: deprecated_member_use
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(
                                            10.0)),
                                    color: Colors.red,
                                    onPressed: () {
                                      if(Token==null){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return Sign_up();
                                                }));
                                      }
                                    else {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return complaint();
                                                }));
                                      }
                                      // _validateInputs();
                                    },
                                    child: Text(
                                      "Report a Complaint",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        drawer:(Token==null)?outsideDrawer():navigationDrawer(),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }
  Future<List<Data>> get_ads() async {
    //replace your restFull API here.
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("Token");

    print('Bearer $token');
    final response = await http.get(
      public_home,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    var list = responseData['ads']['data'] as List;
    // var video = responseData['videos']['data'] as List;
    print(list);
    // var list2 = responseData['data'] as List;
    List<Data> imagesList = list.map((i) => Data.fromJson(i)).toList();
    return imagesList;
  }
  Future<List<Video>> get_videos() async {
    //replace your restFull API here.
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("Token");

    print('Bearer $token');
    final response = await http.get(
      public_home,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    var video = responseData['videos']['data'] as List;
    print(video);
    List<Video> videoList = video.map((i) => Video.fromJson(i)).toList();
    return videoList;
  }
}


