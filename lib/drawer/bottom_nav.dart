import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'package:sphere_bottom_navigation_bar/sphere_bottom_navigation_bar.dart';

import 'nav_drawer.dart';

class BottomNavigation extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NavigatioLayout();
  }
}


class NavigatioLayout extends State<BottomNavigation> {
  MediaQueryData queryData;


  static const IconThemeData selectedIconTheme = IconThemeData(size: 24, color: Colors.purple, );
  int _selectedIndex = 2;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    // Home(),
//    Home(),
//    VendorsClass(),
//    PromotionInnerClass(),
//    PromotionClass(),
//    FeedbackClass(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width;
    Constant.screenHeight = queryData.size.height;

    return Scaffold(
      endDrawer:  SizedBox(
          width: Constant.screenWidth,
          height: Constant.screenHeight,
          child: Theme(
            data: Theme.of(context).copyWith(
              // Set the transparency here
              canvasColor: Color.fromRGBO(255, 255, 255, 0.1), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
            ),
            child:Drawer(
              child: Container(
                child:  NavDrawer(),
              ),
            ),
          )
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 100,
              child: Container(
                color: Palette.darkishPurple,
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        Palette.lightGreen,
                        Palette.lightBlue
                      ],
                    ),
                    // border color
                  ),
                )
            ),
          ],
        ),
      ),

      bottomNavigationBar: SphereBottomNavigationBar(
        defaultSelectedItem: 2,

//        sheetRadius: BorderRadius.only(
//            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        onItemPressed: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        navigationItems: [
          BuildNavigationItem(
            tooltip: '',
            itemColor: Colors.white,
            icon: Icon(Icons.home, color: Colors.black,),
            selectedItemColor: Palette.darkishPurple,
          ),
          BuildNavigationItem(
            tooltip: '',
            itemColor:  Colors.white,
            icon:  Icon(Icons.shopping_cart,  color: Colors.black,),
            selectedItemColor: Palette.darkishPurple,
          ),
          BuildNavigationItem(
            tooltip: '',
            itemColor:  Colors.white,
            icon: Icon(Icons.map, color: Colors.black,),
            selectedItemColor: Palette.darkishPurple,
          ),
          BuildNavigationItem(
              tooltip: '',
              itemColor: Colors.white,
              icon:  Icon(Icons.warning, color: Colors.black,),
              selectedItemColor: Palette.darkishPurple),
          BuildNavigationItem(
              tooltip: 'fda',
              itemColor:  Colors.white,
              icon: Icon(Icons.layers, color: Colors.black,),
              selectedItemColor: Palette.darkishPurple),
        ],
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text(''),
//            activeIcon: Icon(Icons.home ,
//              color: Colors.orange,
//
//
//            )
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.shopping_cart),
//            title: Text(''),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.map),
//            title: Text(''),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.warning),
//            title: Text(''),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.layers, ),
//            title: Text(''),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        unselectedItemColor : Colors.black,
//        onTap: _onItemTapped,
//        fixedColor: Palette.darkishPurple,
//      ),
    );
  }
}