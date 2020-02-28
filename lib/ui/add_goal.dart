
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

class AddGoals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddGoalsLayout();
  }
}

class AddGoalsLayout extends State<AddGoals> {

  MediaQueryData queryData;
  final List<String> goalsList = [
    "Avoid junk food",
    "Walk 10k steps",
    "No sugar day",
    "30mins of yoga",
    "Avoid fizzy drinks",
    "30mins of yoga",
    "Avoid fizzy drinks",
  ];


  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
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
                  color: Colors.white,
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 60,
                  width: Constant.screenWidth * 414,
                  child:Container(
                    width: Constant.screenWidth * 414,
                    height: Constant.screenHeight * 3,
                    color: Palette.grayColor,
                  )
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 60,
                  width: Constant.screenWidth * 414,
                  child: Center(
                    child: Text("Goals",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: "Montserrat-Bold"
                      ),),
                  ),
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 55,
                  left: Constant.screenWidth * 20,
                  width: Constant.screenWidth * 50,
                  child: Center(
                      child: Icon(Icons.arrow_back,
                        color: Colors.black,)
                  ),
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 130,
                  left: Constant.screenWidth * 15,
                  width: Constant.screenWidth * 414,
                  child: Text("Add a ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: "Montserrat-Regular"
                    ),),
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 150,
                  left: Constant.screenWidth * 15,
                  width: Constant.screenWidth * 414,
                  child: Text("Goal",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontFamily: "Montserrat-Bold"
                    ),),
                ),

              ],
            ),
          ),
        )
    );
  }

  _horizontalButtonView(){
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        padding: EdgeInsets.all(10.0),
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.vertical,
        itemCount: goalsList.length,
        itemBuilder: (BuildContext context, int index) {
          return  new Container(
              height: (Constant.screenHeight) *80,
              child: Row(
                children: <Widget>[
                  new Container(
                      width: (Constant.screenHeight ) * 60,
                      height: (Constant.screenHeight ) * 60,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "${imgList[index]}")
                          )
                      )),
                  new Container(
                    margin: EdgeInsetsDirectional.only(start: Constant.screenWidth *30),
                    child: Center(
                      child: Text("${goalsList[index]}"),

                    ),
                  ),
                ],
              )
          );
        });
  }

}