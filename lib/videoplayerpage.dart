import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import 'customAppBar.dart';
import 'drawer.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;
  String url;
  Future getnames() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    url = prefs.getString('Video_Url');
    setState(() {
      url=url;
      print(url);
    });
  }
  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    // _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }
Future initialization() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  url = prefs.getString('Video_Url');
  setState(() {
    url=url;
    print(url);
  });
  print("url====");
    print(url);

  _videoPlayerController1 = VideoPlayerController.network(
     url);
  // _videoPlayerController2 = VideoPlayerController.network(
  //     'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');
  _chewieController = ChewieController(
    videoPlayerController: _videoPlayerController1,
    aspectRatio: 3 / 2,
    autoPlay: true,
    looping: false,
  );

  _videoPlayerController1.addListener(() {
    if (_videoPlayerController1.value.position ==
        _videoPlayerController1.value.duration) {
      print('video Ended');
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                          // InkWell(
                          //   onTap: (){
                          //     Scaffold.of(context).openDrawer();
                          //   },
                          //   child:
                          //   new Image.asset(
                          //     'images/menu.png',
                          //     height: 25.0,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          Text(' ', style: TextStyle(color: Colors.white, fontSize: 25),),
                          Text('Justice Tracker', style: TextStyle(color: Colors.white, fontSize: 25),),
                          Text(' ', style: TextStyle(color: Colors.white, fontSize: 25),)
                        ]),
                  ),
                ],),),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight + 50)),
        body: Column(
          children: <Widget>[
            SizedBox(height: 50,),
            Expanded(
              child: Center(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),

          ],
        ),
        drawer: outsideDrawer(),

    );
  }
}