import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/ui/dashboard.dart';
import 'package:health_plus/utils/constant.dart';

import 'goal_achieved.dart';

class Goals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoalsLayout();
  }
}

class GoalsLayout extends State<Goals> {

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
    'https://images.pexels.com/photos/40751/running-runner-long-distance-fitness-40751.jpeg?cs=srgb&dl=woman-girl-silhouette-jogger-40751.jpg&fm=jpg',
    'https://images.pexels.com/photos/48604/pexels-photo-48604.jpeg?cs=srgb&dl=computer-desk-laptop-stethoscope-48604.jpg&fm=jpg',
    'https://images.pexels.com/photos/936611/pexels-photo-936611.jpeg?cs=srgb&dl=bowl-of-vegetable-salad-and-fruits-936611.jpg&fm=jpg',
    'https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?cs=srgb&dl=adventure-athlete-athletic-daylight-235922.jpg&fm=jpg',
    'https://images.pexels.com/photos/461428/pexels-photo-461428.jpeg?cs=srgb&dl=bamboo-bamboo-whisk-board-bowls-461428.jpg&fm=jpg',
    'https://images.pexels.com/photos/1671217/pexels-photo-1671217.jpeg?cs=srgb&dl=two-woman-doing-exercise-1671217.jpg&fm=jpg',
    'https://images.pexels.com/photos/863977/pexels-photo-863977.jpeg?cs=srgb&dl=three-women-s-doing-exercises-863977.jpg&fm=jpg',
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
                        colors: [Color(0xFFFF8330),
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
                        height: Constant.screenHeight * 812 - (Constant.screenHeight * 160),
                        padding: EdgeInsets.only(top: Constant.screenWidth* 80, left:  Constant.screenWidth * 15 ),

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
                  top: (Constant.screenHeight ) * 47,
                  width: Constant.screenWidth * 414,
                  child: Center(
                    child: Text("Goals",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: "HKGrotesk-Bold"
                      ),),
                  ),
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 35,
                  left: Constant.screenWidth * 20,
                  width: Constant.screenWidth * 50,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));

                      },
                    ),
                ),
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 130,
                  left: Constant.screenWidth * 20,
                  width: Constant.screenWidth * 414,
                  child: Text("Pick a goal for",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: "HKGrotesk-Regular"
                    ),),
                ),
                Positioned(
                  top: (Constant.screenHeight ) * 150,
                  left: Constant.screenWidth * 20,
                  width: Constant.screenWidth * 414,
                  child: Text("Today",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontFamily: "HKGrotesk-Bold"
                    ),),
                ),

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: Icon(Icons.add),
            backgroundColor: Color(0xFFFF8330),
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
          return  GestureDetector(
            child:new Container(
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
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => GoalAchieved()
              ));
            },
          );
        });
  }

}