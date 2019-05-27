import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_backdrop_twoside/flutter_backdrop_twoside.dart';
import 'package:flutter_backdrop_twoside_example/right_layout/right_ui.dart';

import 'front_layout/front_ui.dart';
import 'left_layout/left_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Material(
        child: BackDrop(
          frontLayout: FrontUI(),
          rightLayout: RightUI(),
          leftLayout: LeftUI(),
          leftIconExpand: Icon(Icons.clear , color: Colors.white,),
          leftIconCollapse: Icon(Icons.build, color: Colors.white,),
          rightIconCollapse: Icon(Icons.build, color: Colors.white,),
          rightIconExpand: Icon(Icons.clear , color: Colors.white,),
          headHeight: 100,
          headColor: Theme.of(context).primaryColor,
          headLayout: Text("sadasd"),
        ),
      ),
    );
  }
}
