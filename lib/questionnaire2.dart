import 'customAppBar.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'questionnaire3.dart';

void main() => runApp(new MaterialApp(
home: new questionnaire2()));
class questionnaire2 extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<questionnaire2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  Future<bool> _onBackPressed() async{
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
                        Text('Questionnaire', style: TextStyle(color: Colors.white, fontSize: 25),),
                        Text(' ', style: TextStyle(color: Colors.white, fontSize: 25),),
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
                          child: Text('Questionnaire Name', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_drop_down, color: Colors.white,size: 20,),
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
                          child: Text('Select State', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_drop_down, color: Colors.white,size: 20,),
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
                          child: Text('Select City', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_drop_down, color: Colors.white,size: 20,),
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
                          child: Text('Select Category', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_drop_down, color: Colors.white,size: 20,),
                        ),


                      ],
                    ),

                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                      color: Colors.cyan,
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return questionnaire3();
                        }));

                      },
                      child: Text(
                        "  Next  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],),
              ],
            ),
          ),
        ],
      ),
      drawer: navigationDrawer(),
    );
  }
}

