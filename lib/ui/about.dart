import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'package:package_info/package_info.dart';


class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutLayout();
  }
}

class AboutLayout extends State<About> {

  MediaQueryData queryData;
  String version;
  final List<String> goalsList = [
    "Avoid junk food",
    "Walk 10k steps",
    "No sugar day",
    "30mins of yoga",
    "Avoid fizzy drinks",
    "30mins of yoga",
    "Avoid fizzy drinks",
  ];


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width / 414;
    Constant.screenHeight = queryData.size.height/812;

    return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body:  SingleChildScrollView(
            child:Stack(
              children: <Widget>[
                Container(
                  height: Constant.screenHeight* 812,
                  width: Constant.screenWidth * 414,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF8000),
                          Color(0xFFFF8111),
                          Color(0xFFFC663C),],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 280,
                  width: (Constant.screenWidth ) * 414,
                  child: Center(
                    child: Container(
                      width: (Constant.screenHeight ) * 50,
                      height: (Constant.screenHeight ) * 50,
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                              )
                          )
                      )),
                  ),
                ),
                Positioned(
                top: Constant.screenHeight* 350,
                width: Constant.screenWidth* 414,
                  child: Center(
                    child: Text("helth.plus",
                    style: TextStyle(color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'HKGrotesk-Bold'),),
                  ),
                ),
                Positioned(
                  top: Constant.screenHeight* 380,
                  width: Constant.screenWidth* 414,
                  child: Center(
                    child: Text("Version $version",
                      style: TextStyle(color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'HKGrotesk-Regular'),),
                  ),
                ),
                Positioned(
                  top: Constant.screenHeight* 420,
                  width: Constant.screenWidth* 414,
                  child: Center(
                    child: Text("Created by Rosiru",
                      style: TextStyle(color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: 'HKGrotesk-Regular'),),
                  ),
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 55,
                  left: Constant.screenWidth * 20,
                  width: Constant.screenWidth * 50,
                  child: Center(
                      child: new IconButton(
                          icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                      onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => BottomNavigation(index: 0)
                            ));
                      },)
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  void initState() {
    _getVersion();
  }

  Future<String> _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    print("version $version");
    return "";
  }



}