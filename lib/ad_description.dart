import 'package:shared_preferences/shared_preferences.dart';

import 'call.dart';
import 'customAppBar.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

void main() => runApp(new MaterialApp(
    home: new ad_description()));


class ad_description extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<ad_description> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String title,description,image;
  // ignore: missing_return
  Future<bool> _onBackPressed() {
    Navigator.pop(context);
  }
  Future getnames() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    title = prefs.getString('Ad_Title');
    description = prefs.getString('Ad_Description');
    image=prefs.getString('Ad_Image');
    setState(() {
      title=title;
      description=description;
      image=image;
      print(title);
    });
  }
  @override
  void initState() {
    getnames();
    super.initState();

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
      body: SingleChildScrollView(

        // shrinkWrap: true,
        child: Column(

          children: [
            Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
                Container(
                  height: 150,
                  decoration:
                  new BoxDecoration(
                      borderRadius: BorderRadius
                          .all(Radius
                          .circular(
                          0.0)),
                      image:
                      new DecorationImage(
                        image: NetworkImage(
                            image),
                        fit: BoxFit
                            .cover,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(description,style: TextStyle(fontSize: 16,color: Colors.black),),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: outsideDrawer(),
    );
  }
}

