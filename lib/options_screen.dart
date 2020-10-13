import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_app/animal_detail_screen.dart';

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
  final Function menuCallBack;

  OptionsScreen({@required this.menuCallBack});

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
      imageUrl: "assets/images/1-1.png",
      backgroundColor: Color.fromRGBO(203, 213, 216, 1.0),
    ),
    Animal(
      name: 'sds',
      scientificName: 'fsfsd',
      distanceToUser: '3.5 km',
      age: 1,
      isFemale: true,
      imageUrl: "assets/images/7.jpg",
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
          InkWell(
            onTap: () {
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
                  size: 25.0,
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
    //split size box
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Padding(
            //Drawer menu
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Icon(FontAwesomeIcons.bars),
                  onTap: widget.menuCallBack,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Location',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4)),
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
                  backgroundImage: AssetImage('1.jpg'),
                )
              ],
            ),
          ),
          //Low Menu Search etc
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
                      height: 110.0,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 20.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: animalType.length,
                          itemBuilder: (context, index) {
                            return buildAnimalIcon(index);
                          }),
                    ),

                    //Animals bottom menu
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 10.0),
                          itemCount: animals.length,
                          itemBuilder: (context, index) {
                            final animal = animals[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AnimalDetailsScreen(animal: animal);
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 10.0, right: 20.0, left: 20.0),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      elevation: 4.0,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            SizedBox(
                                              width: deviceWidth * 0.4,
                                            ),
                                            //Animal data
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: <Widget>[
                                                      //Animal Name Style
                                                      Text(
                                                        animal.name,
                                                        style: TextStyle(
                                                            fontSize: 26.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Icon(animal.isFemale
                                                          ? FontAwesomeIcons
                                                              .venus
                                                          : FontAwesomeIcons
                                                              .mars),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  //Animal scientificName Style
                                                  Text(
                                                    animal.scientificName,
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  //Animal age Style
                                                  Text(
                                                    '${animal.age} years old',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .mapMarkerAlt,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: 16.0,
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      //Animal  distanceToUser TextStyle
                                                      Text(
                                                        'Distance: ${animal.distanceToUser}',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    //window in window Photo Animal
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color: animal.backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          height: 190.0,
                                          width: deviceWidth * 0.4,
                                        ),
                                        Image(
                                          image: AssetImage(animal.imageUrl),
                                          height: 200.0,
                                          width: deviceWidth * 0.4,
                                        ),
                                      ],
                                      alignment: Alignment.center,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
