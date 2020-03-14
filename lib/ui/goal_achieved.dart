import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

import 'dashboard.dart';

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
                top: (Constant.screenHeight ) * 60,
                left: Constant.screenWidth * 21,
                width: Constant.screenWidth * 50,
                child:GestureDetector(
                  child: Center(
                      child: Icon(Icons.arrow_back,)
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 110,
                width: Constant.screenWidth *414,
                child:Container(
                  height: (Constant.screenHeight ) * 1,
                  color: Palette.darkGrey,
                )
            ),
            Positioned(
              top: (Constant.screenHeight ) * 130,
              left: Constant.screenWidth * 15,
              width: Constant.screenWidth * 414,
              child: Text("Was this",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontFamily: "HKGrotesk-Regular"
                ),),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 160,
              left: Constant.screenWidth * 15,
              width: Constant.screenWidth * 414,
              child: Text("Goal achieved ?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontFamily: "HKGrotesk-Bold"
                ),),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 200,
              left: Constant.screenWidth * 15,
              right: Constant.screenWidth * 15,
              height: Constant.screenHeight * 350,
              child: Center(
                child:Text("Goal achieved ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:17.0,
                      fontFamily: "HKGrotesk-Medium"
                  ),),
              )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 680,
                left: Constant.screenWidth * 60,
                width: Constant.screenWidth *120 ,
                child:GestureDetector(
                  child: Container(
                      height: Constant.screenHeight* 42,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.0),
                          )
                      ),
                      child: Center(
                        child: Text("No",
                          style: TextStyle(fontSize: 17.0,
                              color: Colors.white),),
                      )),
                  onTap: (){
                    showAlert(context,
                        "Your session has expired! Please log-in again.");
                  },
                )
            ),
            Positioned(
              top: (Constant.screenHeight ) * 680,
              left: Constant.screenWidth * 234,
              width: Constant.screenWidth *120 ,
              child: GestureDetector(
                child: Container(
                    height: Constant.screenHeight* 42,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0),
                        )
                    ),
                    child: Center(
                      child: Text("Yes",
                        style: TextStyle(fontSize: 17.0,
                            color: Colors.white),),
                    )),
                onTap: (){

                },
              )
            ),
          ],
        ),
      ),

    );
  }

  static void showAlert(BuildContext context, String text) {
    var alert = new AlertDialog(
      content: Container(
        child: Row(
          children: <Widget>[Text(text)],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

}