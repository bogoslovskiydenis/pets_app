import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'options_screen.dart';

class AnimalDetailsScreen extends StatelessWidget {
  final Animal animal = Animal(
    name: 'sds',
    scientificName: 'fsfsd',
    distanceToUser: '3.5 km',
    age: 1,
    isFemale: true,
    imageUrl: "assets/images/1-1.png",
    backgroundColor: Color.fromRGBO(203, 213, 216, 1.0),
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.5,
                    color: animal.backgroundColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0 ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Theme.of(context).primaryColor,
                              ),
                              Icon(
                                CupertinoIcons.share,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.3,
                    child: Image(
                      image: AssetImage('assets/images/1-1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              //Lower menu Image
              Expanded(
                  child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, //В конец
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 20.0,
                                backgroundImage:
                                    AssetImage('assets/images/1.jpg'),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8.0,
                          ),

                          //Lower menu Name Surname Data
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Denis Bogoslovskiy',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'data',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Owner',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      //Description
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'TEXT',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                color: Colors.white,
              )),

              //Container Like Adoption
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 4.0,
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24.0,
                      ),
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          elevation: 4.0,
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              'Adoption',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.06),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),

          //Middle menu description
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
            ),
            child: Material(borderRadius: BorderRadius.circular(20.0),
              elevation: 8.0,
              child: Container(padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        //Animal Name Style
                        Text(
                          animal.name,
                          style: TextStyle(
                              fontSize: 26.0,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(animal.isFemale
                            ? FontAwesomeIcons.venus
                            : FontAwesomeIcons.mars),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    //Animal scientificName Style
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          animal.scientificName,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${animal.age} years old',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        //Animal  distanceToUser TextStyle
                        Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 140,
              ),
            ),
          )
        ],
      ),
    );
  }
}
