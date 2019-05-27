import 'package:flutter/material.dart';

class RightUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RightUIState();
  }
}

class RightUIState extends State<RightUI> {
  List<String> titles = <String>[
    "ثبت نام",
    "تماس با ما",
    "آگهی های من",
    "معرفی به دوستان",
    "خروج از حساب کاربری",
  ];
  List<IconData> icons = <IconData>[
    Icons.person,
    Icons.phone,
    Icons.assignment_ind,
    Icons.send,
    Icons.exit_to_app,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: titles.length,
          itemBuilder: (BuildContext context, int index) {
            return menuItems(index);
          },
        ),
      ),
    );
  }

  Widget menuItems(int index) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: FlatButton(
          padding: EdgeInsets.only(bottom: 4,top: 4),
          onPressed: () => print("$index"),
          child: Row(
            children: <Widget>[
              Directionality(textDirection: TextDirection.ltr, child: Icon(icons[index] , color: Colors.white,),),
              Padding(padding: EdgeInsets.only(right: 8),),
              Text(titles[index] , style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
