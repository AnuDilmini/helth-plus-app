
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/ui/dashboard.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

import 'health_inner.dart';

class HealthTips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HealthTipsLayout();
  }
}

class HealthTipsLayout extends State<HealthTips> {

  MediaQueryData queryData;

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
                        colors: [Color(0xFFFF8333),
                          Color(0xFFFC663C),
                          Color(0xFFFF3F1A),],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  child:Column(
                    children: <Widget>[
                      Container(
                        height: Constant.screenHeight *100,
                        width: Constant.screenWidth * 414,

                      ),
                      Container(
                        width: Constant.screenWidth * 414,
                        height: Constant.screenHeight * 812 - (Constant.screenHeight * 100),
//                        padding: EdgeInsetsDirectional.only(top: Constant.screenWidth* 75),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(15.0),
                                topRight: const Radius.circular(15.0))),
                        child: _horizontalButtonView(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: (Constant.screenHeight ) * 60,
                    width: Constant.screenWidth * 414,
                  child: Center(
                    child: Text("Health Tips",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: "HKGrotesk-Bold"
                      ),),
                  ),
                ),
//                Positioned(
//                  left: Constant.screenWidth* 19,
//                  top: Constant.screenHeight *35,
//                  child: IconButton(
//                    icon: Icon(
//                      Icons.arrow_back,
//                      color: Colors.white,
//                    ),
//                    onPressed: () {
//                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
//
//                    },
//                  ),
//                ),

              ],
            ),
          ),
        )
    );
  }

  _horizontalButtonView(){
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return  GestureDetector(
            child:new Container(
                height: (Constant.screenHeight) * 200,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: (Constant.screenHeight) * 140,
                      width: Constant.screenWidth * 414,
                      margin: EdgeInsets.only( top: (Constant.screenHeight) * 4),
                      child: Image.asset("assets/images/health.jpg",
                        fit: BoxFit.fitWidth,
                        alignment:Alignment.center ,

                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top:Constant.screenWidth * 2, right: Constant.screenWidth* 22),
                        height: (Constant.screenHeight)  * 50,
                        width: Constant.screenWidth * 414,
                        child: Text("Summer health tips",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: "HKGrotesk-Regular",
                              color: Palette.darkGrey,
                              fontSize: 17
                          ),
                        )
                    ),
                  ],
                )
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HealthInnerPage()
              )
              );
            },
          );
        });
  }

}