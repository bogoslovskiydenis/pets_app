import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

Color mainColor = Color.fromRGBO(48, 96, 96, 1.0);
Color startingColor = Color.fromRGBO(70, 112, 112, 1.0);

class MyApp extends StatelessWidget {

  List<String> menuItems= [
    'Adoption',
    'Donation',
    'Add pet',
    'Favorites',
    'Profile',
  ];
  Widget buildMenuRow(int index){
    return Padding(padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.paw,
            color: Colors.white,
          ),
          SizedBox(width: 16.0,),
          Text(
            menuItems[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo"
          "",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 24.0,
                        backgroundColor: Colors.amber,
                      ),
                      Text(
                        'Denis',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: menuItems.asMap().entries.map((mapEntry) => buildMenuRow(mapEntry.key)).toList(),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.userCog,
                        color: Colors.white,
                      ),
                      Text(
                        "Settings | Log out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //Color SrartMenu
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [startingColor, mainColor])),
        ),
      ),
    );
  }
}
