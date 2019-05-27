import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';


class FrontUI extends StatefulWidget {
 


  @override
  FrontUIState createState() => new FrontUIState();

}

class FrontUIState extends State<FrontUI> {




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) * 3 / 6;
    final double itemWidth = size.width / 2;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8),
          )),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
            child: Row(
              children: <Widget>[
                Icon(Icons.search),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: '...جستجو کنید',
                    ),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black26,
          ),
          Expanded(
            child:  Center(child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }




}
