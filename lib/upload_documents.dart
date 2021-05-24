import 'customAppBar.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'profile.dart';
import 'summary.dart';
void main() => runApp(new MaterialApp(
home: new upload_documents()));

class upload_documents extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<upload_documents> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  final _campdesccntrl = TextEditingController();

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
                        Text('Upload Documents', style: TextStyle(color: Colors.white, fontSize: 25),),
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
              SizedBox(
                height: 10.0,
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
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child:
                    new Image.asset(
                      'images/upload.png',
                      height: 200.0,
                      width: 200,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
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
                        return summary();
                      }));

                    },
                    child: Text(
                      "  Submit  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new Image.asset(
                          'images/mail.png',
                          height: 25.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Container(
                        child: new Image.asset(
                          'images/tj_arrow.png',
                          height: 25.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Container(
                        child: new Image.asset(
                          'images/tj_pdf.png',
                          height: 25.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Container(
                        child: new Image.asset(
                          'images/tj_arrow.png',
                          height: 25.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      new Container(
                        child: new Image.asset(
                          'images/tj_printer.png',
                          height: 25.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),  // ignore: deprecated_member_use
                ],
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
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => campaign()),
//       // );
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

