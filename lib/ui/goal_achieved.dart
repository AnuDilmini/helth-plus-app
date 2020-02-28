import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

class GoalAchieved extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoalAchievedLayout();
  }
}

class GoalAchievedLayout extends State<GoalAchieved> {

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
        body: Stack(
          children: <Widget>[
            Container(
              height: Constant.screenHeight* 812,
              width: Constant.screenWidth * 414,
            ),
            Positioned(
                top: (Constant.screenHeight ) * 80,
                left: Constant.screenWidth * 21,
                width: Constant.screenWidth * 50,
                child:Center(
                  child: Icon(Icons.arrow_back,
                  )
                )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 200,
                width: Constant.screenWidth * 414,
                child:Center(
                    child: Text("Anushika Dilmini",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Montserrat-Regular",
                          fontSize: 20.0

                      ),)
                )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 300,
                left: Constant.screenWidth * 35,
                right: Constant.screenWidth * 35,
                child:Center(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: new IconButton(
                          icon: new Container(width: Constant.screenWidth * 35, child: new Icon(Icons.payment)),
                          onPressed: () {
                          },
                        ),
                        labelText: "Payments",
                        labelStyle: TextStyle(color: Palette.darkGrey,
                            fontSize: 16.0,
                            fontFamily: "Montserrat-Light"),

                      ),)
                )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 370,
                left: Constant.screenWidth * 35,
                right: Constant.screenWidth * 35,
                child:Center(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: new IconButton(
                          icon: new Container(width: Constant.screenWidth * 35, child: new Icon(Icons.monetization_on)),
                          onPressed: () {
                          },
                        ),
                        labelText: ".life points",
                        labelStyle: TextStyle(color: Palette.darkGrey,
                            fontSize: 16.0,
                            fontFamily: "Montserrat-Light"),

                      ),)
                )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 440,
                left: Constant.screenWidth * 35,
                right: Constant.screenWidth * 35,
                child:Center(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: new IconButton(
                          icon: new Container(width: Constant.screenWidth * 35, child: new Icon(Icons.receipt)),
                          onPressed: () {
                          },
                        ),
                        labelText: "Records",
                        labelStyle: TextStyle(color: Palette.darkGrey,
                            fontSize: 16.0,
                            fontFamily: "Montserrat-Light"),

                      ),)
                )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 510,
                left: Constant.screenWidth * 35,
                right: Constant.screenWidth * 35,
                child:Center(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: new IconButton(
                          icon: new Container(width: Constant.screenWidth * 35, child: new Icon(Icons.business_center)),
                          onPressed: () {
                          },
                        ),
                        labelText: "Purchases",
                        labelStyle: TextStyle(color: Palette.darkGrey,
                            fontSize: 16.0,
                            fontFamily: "Montserrat-Light"),

                      ),)
                )
            ),
//                Positioned(
//                    top: (Constant.screenHeight /896) * 71,
//                    left: (Constant.screenWidth / 414) * 32,
//                    right:(Constant.screenWidth / 414) * 13,
////                    height: (Constant.screenHeight /896) * 300,
//                    child:Center(
//                      child: Container(
//                          width: Constant.screenWidth,
//                          child: Text(
//                            "Navigate & \nExperience \nCinnamon Life the \nRight Way",
//                            textAlign: TextAlign.left,
//                            style: TextStyle(
//                              fontSize: 33.0,
//                              color: Colors.white,
//                              height: 1.5,
//                            ),
//                          )
//                      ),
//                    )
//                ),
//                Positioned(
//                    top: (Constant.screenHeight /896) * 320,
//                    left: (Constant.screenWidth / 414) * 32,
//                    right:(Constant.screenWidth / 414) * 13,
//                    height: (Constant.screenHeight /896) * 134,
//                    child: Container(
//                        child: Text(
//                            "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, sed do \neiusmod tempor.",
//                            textAlign: TextAlign.left,
//                            style: TextStyle(
//                              height: 1.5,
//                              fontSize: 16.0,
//                              color: Colors.white,
//                              fontFamily:"Montserrat-Regular",
//                            )
//                        )
//                    )
//                ),
//                Positioned(
//                    top: (Constant.screenHeight /896) * 444,
//                    height: (Constant.screenHeight /896) *6,
//                    width: Constant.screenWidth,
//                    child: Container(
//                      decoration: new BoxDecoration(
//                        gradient: new LinearGradient(
//                          colors: [
//                            Palette.lightGreen,
//                            Palette.lightBlue
//                          ],
//                        ),
//
//                        // border color
//                      ),
//                    )
//                ),
//                Positioned(
//                  top: (Constant.screenHeight /896) * 565,
//                  left: (Constant.screenWidth / 414) * 18,
//                  right:(Constant.screenWidth / 414) * 18,
//                  height: (Constant.screenHeight /896) * 83,
//                  child:  GestureDetector(
//                    child:Container(
//                      color: Palette.darkishPurple,
//                      child:Row(
//                        children: <Widget>[
//                          Expanded(
//                            flex: 4,
//                            child:Text(
//                              "     Sign in",
//                              textAlign: TextAlign.left,
//                              style: TextStyle(
//                                  fontSize: 20.0,
//                                  color: Colors.white,
//                                  fontFamily: "Montserrat-Regular"
//                              ),
//                            ),
//                          ),
//                          Expanded(
//                            flex: 1,
//                            child: Icon(Icons.arrow_forward,color: Colors.white,
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                    onTap: (){
//
//                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigation()));
//                    },
//                  ),
//                ),
//                Positioned(
//                  top: (Constant.screenHeight /896) * 670,
//                  height: (Constant.screenHeight /896) * 1,
//                  width: Constant.screenWidth,
//                  child: Container(
//                    color: Palette.silver,
//                  ),
//                ),
//                Positioned(
//                    top: (Constant.screenHeight /896) * 696,
//                    left: (Constant.screenWidth / 414) * 18,
//                    right:(Constant.screenWidth / 414) * 18,
//                    height: (Constant.screenHeight /896) * 83,
//                    child: Container(
//                      decoration: BoxDecoration(color: Colors.white,
//                        border: new Border.all(color: Colors.grey,
//                            width: 1.0
//                        ),
//                      ),
//                      child: new RaisedButton(
//                          elevation: 0.0,
//                          child: new Text("Create an Account",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  fontFamily: 'HKGrotesk-Bold',
//                                  fontSize:  17.0,
//                                  color: Colors.grey)),
//                          color: Colors.white,
//
//                          onPressed: () {
////                            Navigator.push(
////                                context,
////                                MaterialPageRoute(builder: (context) => SignUpClass())
////                            );
//
//                          }
//                      ),
//                    )
//                ),
          ],
        ),
      ),

    );
  }

}