import 'customAppBar.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'profile.dart';
void main() => runApp(new MaterialApp(
    home: new summary()));
class summary extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<summary> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  final _statecntrl = TextEditingController();
  final _campnamecntrl = TextEditingController();
  final _campdesccntrl = TextEditingController();
  final _timecntrl = TextEditingController();
  final _categorycntrl = TextEditingController();
  final _loccntrl = TextEditingController();
  final _datecntrl = TextEditingController();
  final _servicecntrl = TextEditingController();
  Future<bool> _onBackPressed() async{
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
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
                        Text('Summary', style: TextStyle(color: Colors.white, fontSize: 25),),
                        InkWell(
                          onTap: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return profile();
                            }));
                          },
                          child:
                          new Image.asset(
                            'images/profile-white.png',
                            height: 20.0,
                            fit: BoxFit.cover,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
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
          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
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
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),

                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
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
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "State :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
                  controller: _statecntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter State';
                    else
                      return null;
                  },
                  cursorColor: Colors.blue,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),

                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
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
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Category :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
                  controller: _categorycntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter Category';
                    else
                      return null;
                  },
                  cursorColor: Colors.blue,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),

                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
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
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Incident Location :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
                  controller: _loccntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter Location';
                    else
                      return null;
                  },
                  cursorColor: Colors.blue,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),

                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
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
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Time :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
                  controller: _timecntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter Time';
                    else
                      return null;
                  },
                  cursorColor: Colors.blue,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),

                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
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
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Date :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
                  controller: _datecntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter Date';
                    else
                      return null;
                  },
                  cursorColor: Colors.blue,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),

                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
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
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Service Type :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
                  controller: _servicecntrl,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  validator: (String arg) {
                    if (arg.length < 3)
                      return 'Enter Service Type';
                    else
                      return null;
                  },
                  cursorColor: Colors.blue,
                  autocorrect: true,
                  decoration: new InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),

                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
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
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Description :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                TextFormField(
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
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),

                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey[350], width: 2.0),
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
                    labelStyle:
                    new TextStyle(color: Colors.black, fontSize: 15),

                    fillColor: Colors.grey[350],
                    isDense: true,                      // Added this
                    contentPadding: EdgeInsets.all(4),
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ]),


          SizedBox(
            height: 40.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){

                },
                child:
                new Image.asset(
                  'images/foundation_download.png',
                  height: 50.0,
                  fit: BoxFit.cover,
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

