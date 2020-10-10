import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Animal {
  String name;
  String scientificName;
  double age;
  String distanceToUser;
  bool isFemale;
  String imageUrl;
  Color backgroundColor;

  Animal(
      {this.name,
      this.scientificName,
      this.age,
      this.backgroundColor,
      this.distanceToUser,
      this.imageUrl,
      this.isFemale});
}

class OptionsScreen extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  int selectedAnimalIconIndex = 0;

  final List<Animal> animals = [
    Animal(
      name: 'sds',
      scientificName: 'fsfsd',
      distanceToUser: '3.5 km',
      age: 1,
      isFemale: true,
      //imageUrl: ,
      backgroundColor: Color.fromRGBO(237, 214, 180, 1.0),
    ),
    Animal(
      name: 'sds',
      scientificName: 'fsfsd',
      distanceToUser: '3.5 km',
      age: 1,
      isFemale: true,
      //imageUrl: ,
      backgroundColor: Color.fromRGBO(237, 214, 180, 1.0),
    ),
  ];

  List<String> animalType = [
    "Cat",
    "Dogs",
    "Fish",
    "Parrots",
    "Fish",
  ];

  List<IconData> animalIcons = [
    FontAwesomeIcons.cat,
    FontAwesomeIcons.dog,
    FontAwesomeIcons.fish,
    FontAwesomeIcons.crow,
    FontAwesomeIcons.fish,
  ];

  //Animal Icons
  Widget buildAnimalIcon(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Column(
        children: <Widget>[
          InkWell(onTap: (){
            setState(() {
              selectedAnimalIconIndex = index;
            });
          },
            child: Material(
              color: selectedAnimalIconIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
              elevation: 8.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  animalIcons[index],
                  size: 30.0,
                  color: selectedAnimalIconIndex == index
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            animalType[index],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Padding(
              //Верхнее Меню
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(FontAwesomeIcons.bars),
                  Column(
                    children: <Widget>[
                      Text(
                        'Location',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.4)),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mapMarkedAlt,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            'Kyiv, ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          Text(
                            'Ukraine',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('2.jpg'),
                  )
                ],
              ),
            ),
            //нижнее меню Поиск
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).primaryColor.withOpacity(0.05),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 22.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.search),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(fontSize: 18.0),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: "Search pets"),
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.filter,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),

                      //Icon Pets
                      Container(
                        height: 120.0,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 24.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: animalType.length,
                            itemBuilder: (context, index) {
                              return buildAnimalIcon(index);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
