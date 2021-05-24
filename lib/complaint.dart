import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'campaign2.dart';
import 'customAppBar.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

import 'profile.dart';

void main() => runApp(new MaterialApp(home: new complaint()));

// ignore: camel_case_types
class complaint extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<complaint> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  BuildContext get context => null;
  String fileName,Token;
  File _imageFile;
  final _campcreatecntrl = TextEditingController();
  final _campnamecntrl = TextEditingController();
  final _campdesccntrl = TextEditingController();

  // ignore: missing_return
  Future<bool> _onBackPressed() {
    Navigator.pop(context);
  }
  Future uploadImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile.path);
      print("image file");
      print(_imageFile);
      fileName = pickedFile.path
          .split('/')
          .last;
      print(fileName);
    });
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
  void initState() {
    getnames();
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
                            'Help Desk',
                            style:
                            TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(" ")
                        ]),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 50)),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              new Form(
                key: _formKey,
                child: FormUI(),
              ),
              SizedBox(
                height: 30,
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
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Campaign Name :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _campnamecntrl,
            keyboardType: TextInputType.text,
            maxLines: 2,
            validator: (String arg) {
              if (arg.length < 3)
                return 'Enter Subject';
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
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Enter Description :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _campdesccntrl,
            keyboardType: TextInputType.text,
            maxLines: 3,
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
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                text:
                'Please enter the details of your request. A member of the Help Desk'
                    ' team will respond as soon as possible.',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),


          Container(
            height: 40,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: InkWell(
                    onTap: () {
                      uploadImage();
                    },
                    child: Icon(
                      Icons.cloud_upload,
                      color: Colors.cyan,
                      size: 35,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),

                  child: _imageFile == null
                      ? Text("Upload Image Attachment(if any)",
                    style: TextStyle(fontSize: 18, color: Colors.cyan,),)
                      : Text(fileName, style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.cyan),),
                ),
              ],
            ),

          ),
          SizedBox(
            height: 30.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                color: Colors.cyan,
                onPressed: () {
                  print("jjjjjj22");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return campaign2();
                  }));

                },
                child: Text(
                  " Submit ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),


            ],
          )
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
