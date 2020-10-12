import 'package:flutter/material.dart';
import 'package:pets_app/menu_screen.dart';
import 'package:pets_app/options_screen.dart';

class MenuFrame extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MenuFrame> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> scaleAnimation;
  Duration duration = Duration(milliseconds: 200);
  bool menuOpened = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        MenuScreen(),
        AnimatedPositioned(
          duration: duration,
          top: 0,
          bottom: 0,
          left: menuOpened ? screenWidth * 0.30 : 0.0,
          right: menuOpened ? screenWidth * -0.30 : 0.0,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: GestureDetector(
              onTap: () {
                if (menuOpened) {
                  setState(() {
                    menuOpened = false;
                    _animationController.reverse();
                  });
                }
              },
              child: AbsorbPointer(
                absorbing: menuOpened,
                child: Material(
                  animationDuration: duration,
                  borderRadius: BorderRadius.circular(menuOpened ? 40.0 : 0.0),
                  child: OptionsScreen(
                    menuCallBack: () {
                      setState(() {
                        menuOpened = true;
                        _animationController.forward();
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
