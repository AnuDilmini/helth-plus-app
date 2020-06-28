
import 'package:flutter/material.dart';
import 'package:health_plus/ui/dashboard.dart';
import 'package:health_plus/ui/discover.dart';
import 'package:health_plus/ui/profile.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'nav_drawer.dart';


class BottomNav extends StatefulWidget {

  BottomNav({Key key, this.title, this.index}) : super(key: key);
  final String title;
  final int index;


  @override
  _BottomNavigation createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNav> {
  String catName;
  static int selectedIndex;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  MediaQueryData queryData;

  List<Widget> pages() => [
    Dashboard(),
    Discover(),
    Profile(),
  ];

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  @override
  void initState() {
    selectedIndex = widget.index;
// categoryID = 2;

// termsQuick =TermsQuickView(categoryId: widget.categoryId,);

  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width;
    Constant.screenHeight = queryData.size.height;
    final List<Widget> children = pages();

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      drawerScrimColor: Colors.transparent,
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
              left: 5,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height:  Constant.screenHeight/7,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top:  Constant.screenHeight/40),
                    height:  Constant.screenHeight,
                    child: BottomNavigationBar(
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
                      type: BottomNavigationBarType.fixed,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}