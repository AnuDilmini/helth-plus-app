import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/ui/about.dart';
import 'package:health_plus/ui/profile_edit.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_nav.dart';
import 'bottom_navigation.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  String version = "";
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width;
    Constant.screenHeight = queryData.size.height;
    return Drawer(
        child:Stack(
          children: <Widget>[
            Container(
              width: Constant.screenWidth,
              height: Constant.screenHeight,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    height:(Constant.screenHeight/896) *200,
                    width: Constant.screenWidth,
                    color: Palette.orangeLight,
                  ),
                ],
              ),
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 60,
                left: (Constant.screenWidth/414) * 40,
                width:(Constant.screenWidth/414) * 70,
                height: (Constant.screenHeight /896) * 70,
                child:new Container(
                    width: (Constant.screenHeight /896) * 54,
                    height:(Constant.screenHeight /896) * 54,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                        shape: BoxShape.circle,
                      image:  DecorationImage(
                        image: AssetImage("assets/images/celebrity.png"),
                      ),
//                        image: new DecorationImage(
//                            fit: BoxFit.fill,
//                            image: new NetworkImage(
//                                "${imgList[index]}")
//                        )
                    )),
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 145,
                left: (Constant.screenWidth/414) * 40,
                width: Constant.screenWidth,
                child: Text("Hello, Rosiru",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "HKGrotesk-Regular",
                      fontSize: 17.0
                  ),)
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 260,
                left: (Constant.screenWidth/414) * 40,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Home",
                    style: TextStyle(
                        color: Palette.orangeLight,
                        fontFamily: "HKGrotesk-Bold",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigation(index: 0,)));

                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 330,
                left: (Constant.screenWidth/414) * 40,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Profile",
                    style: TextStyle(
                        color: Palette.orangeLight,
                        fontFamily: "HKGrotesk-Bold",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileEdit()));

                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 400,
                left: (Constant.screenWidth/414) * 40,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Helps",
                    style: TextStyle(
                        color: Palette.orangeLight,
                        fontFamily: "HKGrotesk-Bold",
                        fontSize: 17.0
                    ),),
                  onTap: (){
//                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileEdit()));

                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 470,
                left: (Constant.screenWidth/414) * 40,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("About Us ",
                    style: TextStyle(
                        color: Palette.orangeLight,
                        fontFamily: "HKGrotesk-Bold",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => About()));

                  },
                )
            ),
//            Positioned(
//                top: (Constant.screenHeight /896) * 469,
//                left: (Constant.screenWidth/414) * 40,
//                width: Constant.screenWidth,
//                child: GestureDetector(
//                  child: Text("Dining and Entertainment",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontFamily: "HKGrotesk-Light",
//                        fontSize: 17.0
//                    ),),
//                  onTap: (){
//                    print("Dining and Entertainment");
//                  },
//                )
//            ),
//            Positioned(
//                top: (Constant.screenHeight /896) * 520,
//                left: (Constant.screenWidth/414) * 40,
//                width: Constant.screenWidth,
//                child: GestureDetector(
//                  child: Text("Restaurants",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontFamily: "HKGrotesk-Light",
//                        fontSize: 17.0
//                    ),),
//                  onTap: (){
//                    print("Restaurants");
//                  },
//                )
//            ),
//            Positioned(
//                top: (Constant.screenHeight /896) * 572,
//                left: (Constant.screenWidth/414) * 40,
//                width: Constant.screenWidth,
//                child: GestureDetector(
//                  child:Text("Parking",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontFamily: "HKGrotesk-Light",
//                        fontSize: 17.0
//                    ),) ,
//                  onTap: (){
//                    print("Parking");
//                  },
//                )
//            ),
//            Positioned(
//                top: (Constant.screenHeight /896) * 623,
//                left: (Constant.screenWidth/414) * 40,
//                width: Constant.screenWidth,
//                child: GestureDetector(
//                  child: Text("Settings",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontFamily: "HKGrotesk-Light",
//                        fontSize: 17.0
//                    ),),
//                  onTap: (){
//                    print("Settings");
//                  },
//                )
//            ),
            Positioned(
                top: (Constant.screenHeight /896) *814,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Container(
                    height: (Constant.screenHeight /896) * 90,
                    color: Palette.orangeLight,
                  ),
                  onTap: (){
                    print("logout");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 840,
                left: (Constant.screenWidth/414) * 40,
                right: (Constant.screenWidth/414) * 245,
                child: GestureDetector(
                  child: Icon(Icons.exit_to_app,
                    color: Colors.white,),
                  onTap: (){
                    print("logout icon");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 845,
                left: (Constant.screenWidth/414) * 87,
                right: (Constant.screenWidth/414) * 125,
                child: GestureDetector(
                  child: Text("Log Out",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: "HKGrotesk-Bold",
                        color: Colors.white
                    ),
                  ),
                  onTap: (){
                    print("Log Out message");

                    showExitAlertDialog();
                  },
                )
            ),
          ],
        )
    );
  }

  void showExitAlertDialog() async{
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: () {

                SystemNavigator.pop();

              },
            ),
          ],
        );
      },
    );
  }



  @override
  void initState() {
  }

}
