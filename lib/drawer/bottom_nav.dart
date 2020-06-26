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

  static const IconThemeData selectedIconTheme = IconThemeData(size: 24, color: Colors.purple, );
  static int selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Discover(),
    Profile(),
//    PromotionInnerClass(),
//    PromotionClass(),
//    FeedbackClass(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  void initState() {
    selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width;
    Constant.screenHeight = queryData.size.height;
    Constant.scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SizedBox(
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
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
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
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
  }