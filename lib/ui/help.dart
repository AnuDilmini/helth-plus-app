import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/utils/Palette.dart';

class Help  extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HelpLayout();
  }
}


class HelpLayout extends State<Help> {
  MediaQueryData queryData;
  String data= "Anu";
  bool isLoading= true;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    int screenHeight = queryData.size.height.round();
    int screenWeight = queryData.size.width.round();
    int topBarHeight = ((screenWeight * 77 )/ 375).round();
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
            gradient: LinearGradient(
              colors: [Palette.orangeLight,Palette.orangeColor, Palette.orangeDark],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ) ,
        child:SafeArea(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: topBarHeight,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
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
                      Expanded(
                        flex: 10,
                        child: Text("Help",
                          style:  TextStyle(fontFamily: "HKGrotesk-Bold",
                          fontSize: 18.0,
                          color: Colors.white),
                         ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: screenHeight -topBarHeight ,
                child:Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft:  const  Radius.circular(8.0),
                          topRight: const  Radius.circular(8.0))
                  ),
                  child: SingleChildScrollView(
                      child:
                      new Center(
                        child: SingleChildScrollView(
                          child: Text("Help",
                          style: TextStyle(fontSize: 14.0,
                          fontFamily: "HKGrotesk-Regular",
                          color: Colors.black),
                          ),
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}






