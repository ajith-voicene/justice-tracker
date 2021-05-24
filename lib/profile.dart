import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customAppBar.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'urls.dart';

void main() => runApp(new MaterialApp(
    home: new profile()));
class profile extends StatefulWidget {
  @override
  profile_State createState() {
    return new profile_State();
  }
}
class profile_State extends State<profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  File _image;
  String name,email, base64Image,profile_photo_url;
  final _namecntrl = TextEditingController();
  final _usercntrl = TextEditingController();

  // ignore: missing_return
  Future<bool> _onBackPressed() {
    Navigator.pop(context);
  }
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      base64Image = base64Encode(image.readAsBytesSync());
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      base64Image = base64Encode(image.readAsBytesSync());
      _image = image;
    });

  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  void initState() {
    my_profile();
    getnames();
    super.initState();

  }
  Future getnames() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('Name');
    email = prefs.getString('EmailId');
    profile_photo_url=prefs.getString('profile_photo_url');
    setState(() {
      name=name;
      email=email;
      profile_photo_url=profile_photo_url;
      print(name);
    });
  }
  @override
  Widget build(BuildContext context) {
    if(name==null){
      name=" ";
    }
    else{
      _namecntrl.value=TextEditingValue(text: name,selection: TextSelection.collapsed(offset: name.length),);
    }
    if(email==null){
      email=" ";
    }
    else{
      _usercntrl.value=TextEditingValue(text: email,selection: TextSelection.collapsed(offset: email.length));

    }
    if(profile_photo_url==null){
      profile_photo_url="https://picsum.photos/250?image=9";
    }else{
      profile_photo_url=profile_photo_url;
    }
    return Scaffold(
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
                        Text('Profile', style: TextStyle(color: Colors.white, fontSize: 25),),
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
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.cyan,
                    child: _image != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        _image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: new DecorationImage(
                          image: NetworkImage(
                              profile_photo_url),
                          fit: BoxFit.cover,

                        ),),
                      width: 100,
                      height: 100,
                      // child: Icon(
                      //   Icons.camera_alt,
                      //   color: Colors.grey[800],
                      // ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
      padding: const EdgeInsets.all(40.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),

          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
                  controller: _namecntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter Name';
                    else
                      return null;
                  },
                  cursorColor: Colors.blue,
                  enableInteractiveSelection: false,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]),
                    ),

                    labelText: 'Name :',
                    labelStyle: TextStyle(color: Colors.grey[800]),

                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 15.0,
          ),



          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
                  controller: _usercntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter UserName';
                    else
                      return null;
                  },
                  cursorColor: Colors.blue,
                  enableInteractiveSelection: false,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]),
                    ),

                    labelText: 'UserName :',
                    labelStyle: TextStyle(color: Colors.grey[800]),

                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 15.0,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.cyan,
                  onPressed: () {

                    _validateInputs();
                  },
                  child: Text(
                    "  Submit  ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
  void _validateInputs() {

    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables

      _formKey.currentState.save();
      // my_profile();
      print("success");
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
      print("failure");
    }
  }
  Future<String> my_profile() async { // <------ CHANGED THIS LINE

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("Token");
    print("token123");
    print(token);
    final response = await http.get(
      my_Profile_url,
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Name', responseJson['data']['name']);
      prefs.setString('EmailId', responseJson['data']['email']);
      prefs.setString('profile_photo_url', responseJson['data']['profile_photo_url']);
      print('RETURNING: ' + response.body);
      // Fluttertoast.showToast(
      //     msg:message,
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIos: 1,
      //     backgroundColor: Colors.black,
      //     textColor: Colors.white,
      //     fontSize: 14.0
      // );



    } else {
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
  }
}

