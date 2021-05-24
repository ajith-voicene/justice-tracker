import 'call.dart';
import 'customAppBar.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'profile.dart';
void main() => runApp(new MaterialApp(
    home: new emergency()));


class emergency extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<emergency> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  final _messagecntrl = TextEditingController();


  Future<bool> _onBackPressed() {
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
                        Text('Emergency', style: TextStyle(color: Colors.white, fontSize: 25),),
                        Text(' ', style: TextStyle(color: Colors.white, fontSize: 25),),
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
      drawer: outsideDrawer(),
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
                    child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.white,size: 20,),
                          Text('   Select Contact', style: TextStyle(color: Colors.white, fontSize: 16),)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_right, color: Colors.white,size: 20,),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              "Message :",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  TextFormField(
                    controller: _messagecntrl,
                    keyboardType: TextInputType.text,
                    maxLines: 7,
                    validator: (String arg) {
                      if (arg.length < 0)
                        return 'Enter Message';
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
          ),
          SizedBox(
            height: 15.0,
          ),

          Column(
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
                  "  Send  ",
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
  void _validateInputs() {

    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables

      _formKey.currentState.save();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => campaign()),
      // );
      print("success");
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
      print("failure");
    }
  }
}

