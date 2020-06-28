import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_plus/ui/create_post.dart';
import 'package:health_plus/ui/dashboard.dart';
import 'package:health_plus/ui/discover.dart';
import 'package:health_plus/ui/goal_achieved.dart';
import 'package:health_plus/ui/health_tips.dart';
import 'package:health_plus/ui/profile.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'package:sphere_bottom_navigation_bar/sphere_bottom_navigation_bar.dart';
import 'nav_drawer.dart';

class BottomNavigation extends StatefulWidget {

  final int index;
  BottomNavigation({this.index});

  @override
  State<StatefulWidget> createState() {
    return NavigatioLayout();
  }
}

class NavigatioLayout extends State<BottomNavigation> {
  MediaQueryData queryData;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  static const IconThemeData selectedIconTheme = IconThemeData(size: 24, color: Colors.purple, );
  static int selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);


  List<Widget> pages() => [
    Dashboard(),
    Discover(),
    Profile(),
  ];


  @override
  void initState() {
    selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width;
    Constant.screenHeight = queryData.size.height;
    final List<Widget> children = pages();
    return Scaffold(
      key: _scaffoldKey,
      drawer: selectedIndex == 0 ? SizedBox(
          width: (Constant.screenWidth/5) * 4,
          height: Constant.screenHeight,

          child: Theme(
            data: Theme.of(context).copyWith(
              // Set the transparency here
              canvasColor: Color.fromRGBO(255, 255, 255, 0.1), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
            ),
            child:Drawer(
              child: Container(
                child: NavDrawer(),
              ),
            ),
          )
      ):
      null,
      body: Stack(
        children: <Widget>[
      Container(
        child: children[selectedIndex],
      ),
          selectedIndex == 0?
      Positioned(
          top: (Constant.screenHeight/8) * 0.5,
          left: 15,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: GestureDetector(
                  child: Icon(Icons.menu,
                  color: Palette.orangeColor,
                  ),
                  onTap: () {
                    print("drawer");

                    _scaffoldKey.currentState.openDrawer();
//                              Scaffold.of(context).openDrawer();
                  },
                ),
              ),
            ),
          )
      ): Align(
        alignment: Alignment.bottomCenter,),
      ]
    ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Discover'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Me'),
          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.school),
//            title: Text('School'),
//          ),
        ],
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
  }