

import 'customAppBar.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

void main() => runApp(new MaterialApp(
home: new call()));


class call extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<call> {

  Future<bool> _onBackPressed() {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text('Call', style: TextStyle(color: Colors.white, fontSize: 25),),
                        Text(' ', style: TextStyle(color: Colors.white, fontSize: 25),)
                      ]),
                ),
              ],),),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 50)),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              new Image.asset(
                'images/profile-call1.png',
                height: 120.0,
                fit: BoxFit.cover,
              ),

              SizedBox(
                height: 30,
              ),
              new Image.asset(
                'images/call2.png',
                height: 80.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Call', style: TextStyle(color: Colors.grey[800], fontSize: 20),),


            ],
          ),
        ],
      ),
      drawer: navigationDrawer(),
    );
  }

}

