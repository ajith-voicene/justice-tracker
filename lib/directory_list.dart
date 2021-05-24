import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'call.dart';
import 'customAppBar.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import 'urls.dart';
class Data {
   final int id;
  final String title;
   Data({this.id,this.title});
  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      id: parsedJson['id'],
      title: parsedJson['title'],
    );
  }
}
class states {
  final int id;
  final String name;
  final int country_id;
  states({this.id, this.name, this.country_id});
  factory states.fromJson(Map<String, dynamic> parsedJson) {
    return states(
      id: parsedJson['id'],
      name: parsedJson['name'],
      country_id: parsedJson['country_id'],
    );
  }
}
// ignore: camel_case_types
class city {
  final int id;
  final String name;
  final int state_id;
  city({this.id, this.name, this.state_id});
  factory city.fromJson(Map<String, dynamic> parsedJson) {
    return city(
      id: parsedJson['id'],
      name: parsedJson['name'],
      state_id: parsedJson['state_id'],
    );
  }
}
void main() => runApp(new MaterialApp(
home: new directory_list()));


class directory_list extends StatefulWidget {
  @override
  _State createState() {
    return new _State();
  }
}

class _State extends State<directory_list> {
  Data selectedTag;
  states _selectstate;
  city _selectcity;
  bool _visible=false;
  bool _visible_button=false;
  // ignore: non_constant_identifier_names
  String _country_id=" ",_city_id,Token;
  List<String> _locations = ['No Cities Available']; // Option 2
  String _selectedLocation;
  Future<List<Data>> _tags;
  Future<List<states>> _state;
  Future<List<city>> citysss;
  // ignore: missing_return
  Future<bool> _onBackPressed() {
    Navigator.pop(context);
  }
  Future getnames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Token = prefs.getString('Token');
    setState(() {
      Token=Token;
    });
    print(Token);
  }
  @override
  void initState() {
    getnames();
    _tags = get_directory();
    _state=get_states();
    citysss=get_city();
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
                        Text('Directory list', style: TextStyle(color: Colors.white, fontSize: 25),),
                        Text(' ', style: TextStyle(color: Colors.white, fontSize: 25),)
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                FutureBuilder<List<Data>>(
                    future: _tags,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                              canvasColor: Colors.grey[900],
                              buttonTheme: ButtonTheme.of(context).copyWith(
                                alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                              )
                          ),
                          child: SizedBox(
                            width: 330,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<Data>(
                                  iconEnabledColor: Colors.white,
                                  value: selectedTag,
                                  items: snapshot.data.map((values) {
                                    print("hhjkkkk");
                                    print(values.id);
                                    return  DropdownMenuItem<Data>(
                                      value: values,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(values.title,style: TextStyle(color: Colors.white),),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Category",style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,),
                                  ),
                                  onChanged: (Data chosenTag) {
                                    setState(() {
                                      selectedTag = chosenTag;
                                    });
                                  },

                                ),
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return   new Center(
                      child: new CircularProgressIndicator(
                      valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.cyan),
                      ));
                    }),
                SizedBox(height: 8,),
                FutureBuilder<List<states>>(
                    future: _state,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                              canvasColor: Colors.grey[900],
                              buttonTheme: ButtonTheme.of(context).copyWith(
                                alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                              )
                          ),
                          child: SizedBox(
                            width: 330,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<states>(
                                  iconEnabledColor: Colors.white,
                                  value: _selectstate,
                                  items: snapshot.data.map((values) {
                                    return  DropdownMenuItem<states>(
                                      value: values,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(values.name,style: TextStyle(color: Colors.white),),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("States",style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,),
                                  ),
                                  onChanged: (states chosenTag) async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    setState(() {
                                       _visible=true;
                                       _selectstate = chosenTag;
                                      _country_id=_selectstate.id.toString();
                                      prefs.setString('Id', _country_id);
                                      print("id=======");
                                      print(_country_id);
                                       get_city();
                                       // Navigator.push(
                                       //   context,
                                       //   MaterialPageRoute(builder: (context) => directory_list()),
                                       // );
                                    });

                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }
else{
                      return Container(width: 0.0, height: 0.0);}
                    }),
                SizedBox(height: 8,),
                Visibility(
                  visible: _visible,
                  child: FutureBuilder<List<city>>(
                      future: get_city(),
                      builder: (context, snapshot) {
                    if(snapshot.hasData) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                                canvasColor: Colors.grey[900],
                                buttonTheme: ButtonTheme.of(context).copyWith(
                                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                                )
                            ),
                            child: SizedBox(
                              width: 330,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<city>(
                                    iconEnabledColor: Colors.white,
                                    value: _selectcity,
                                    items: snapshot.data.map((valuesss) {
                                      return DropdownMenuItem<city>(
                                          value: valuesss,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(valuesss.name,
                                              style: TextStyle(
                                                  color: Colors.white),),
                                          ),
                                        );
                                    }).toList(),
                                    hint: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("City",style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,),
                                    ),
                                    onChanged: (city chosenTag) {
                                      setState(() {
                                        _visible_button=false;
                                        _selectcity = chosenTag;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        else{
                          return   new Center(
                        child: new CircularProgressIndicator(
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.cyan),
                        ));
                        }
                      }),
                ),
                SizedBox(height: 15,),
                Visibility(
                  visible: _visible_button,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        color: Colors.cyan,
                        onPressed: () {
                          _selectcity=null;
                          _selectstate=null;
                          selectedTag=null;
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
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: (Token==null)?outsideDrawer():navigationDrawer(),
    );
  }

  // ignore: non_constant_identifier_names
  Future<List<Data>> get_directory() async {
    //replace your restFull API here.
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("Token");

    print('Bearer $token');
    final response = await http.get(
      directorylist,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    var list = responseData['categories'] as List;
    print(list);
    List<Data> imagesList = list.map((i) => Data.fromJson(i)).toList();
    return imagesList;
  }
  // ignore: non_constant_identifier_names
  Future<List<states>> get_states() async {
    //replace your restFull API here.
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("Token");

    print('Bearer $token');

    final response = await http.get(
      directorylist,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    var list = responseData['states'] as List;
    print(list);
    List<states> imagesList = list.map((i) => states.fromJson(i)).toList();
    return imagesList;
  }
  // ignore: non_constant_identifier_names
  Future<List<city>> get_city() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("Token");
    String id = pref.getString('Id');
    String cityid = pref.getString('City_Id');
    print("id1111111111");
print(id);
// _selectcity=null;
 // _selectcity=_selectcity.name as city;
print(directorylist+"/"+id);

    print('Bearer $token');
    final response = await http.get(
      directorylist+"/"+id,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    var list = responseData['cities'] as List;
    // ignore: unrelated_type_equality_checks


    print("list=====");
    print(list);
    List<city> imagesList = list.map((i) => city.fromJson(i)).toList();
    _selectcity=null;
    return imagesList;
  }
}

