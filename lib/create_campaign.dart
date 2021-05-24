import 'campaign2.dart';
import 'customAppBar.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

import 'profile.dart';

void main() => runApp(new MaterialApp(home: new create_campaign()));

class create_campaign extends StatefulWidget {
  @override
  create_campaignState createState() {
    return new create_campaignState();
  }
}

class create_campaignState extends State<create_campaign> {

  // ignore: missing_return
  Future<bool> _onBackPressed() async{
    Navigator.pop(context,true);
  }
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // bool _autoValidate = false;
  // BuildContext get context => null;
  final _campcreatecntrl = TextEditingController();
  final _campnamecntrl = TextEditingController();
  final _campdesccntrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            'Create Campaign',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return profile();
                              }));
                            },
                            child: new Image.asset(
                              'images/profile-white.png',
                              height: 20.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 50)),
      body: Stack(children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: [
              Container(
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Campaign Name :",
                        style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: _campnamecntrl,
                        keyboardType: TextInputType.text,
                        maxLines: 2,
                        validator: (String arg) {
                          if (arg.length < 3)
                            return 'Enter Campaign Name';
                          else
                            return null;
                        },
                        cursorColor: Colors.blue,
                        autocorrect: true,
                        decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[350], width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[350], width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[350], width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          // hintText: "Email ID",
                          labelStyle: new TextStyle(color: Colors.black, fontSize: 15),

                          fillColor: Colors.grey[350],
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(4),
                        ),
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Campaign Description :",
                        style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: _campdesccntrl,
                        keyboardType: TextInputType.text,
                        maxLines: 7,
                        validator: (String arg) {
                          if (arg.length < 3)
                            return 'Enter Campaign Description';
                          else
                            return null;
                        },
                        cursorColor: Colors.blue,
                        autocorrect: true,
                        decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[350], width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[350], width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[350], width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          // hintText: "Email ID",
                          labelStyle: new TextStyle(color: Colors.black, fontSize: 15),

                          fillColor: Colors.grey[350],
                          isDense: true, // Added this
                          contentPadding: EdgeInsets.all(4),
                        ),
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ignore: deprecated_member_use
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          color: Colors.cyan,
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return campaign2();
                            }));

                          },
                          child: Text(
                            "  End For Signature  ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(" "),
                            Icon(
                              Icons.share,
                              color: Colors.cyan,
                              size: 40,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: navigationDrawer(),
    );
  }

  Widget FormUI() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

        ],
      ),
    );
  }
//   void _validateInputs() {
//
//     if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//
//       _formKey.currentState.save();
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) {
//         return campaign2();
//       }));
//       print("success");
//     } else {
// //    If all data are not valid then start auto validation.
//       setState(() {
//         _autoValidate = true;
//       });
//       print("failure");
//     }
//   }
}
