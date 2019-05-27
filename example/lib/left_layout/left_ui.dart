import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';



class LeftUI extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LeftUIState();
  }
}

class LeftUIState extends State<LeftUI> {





  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: Text("انتخاب شهر"),
            ),
            RaisedButton(
              child: Text("انتخاب شهر"),
            ),
            Padding(padding: EdgeInsets.only(top: 8),),
            Text("محدوده قیمت" , textAlign: TextAlign.right, style: TextStyle(color: Colors.white),),
            Padding(padding: EdgeInsets.only(top: 8),),
          
          ],
        ),
      ),
    );
  }







}
