import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/nav_drawer.dart';
import 'package:health_plus/ui/profile_edit.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health/health.dart';

import '../utils/constant.dart';
import 'create_post.dart';
import 'goals.dart';
import 'google_fit.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  MediaQueryData queryData;
  int _current = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> imgList = [
    'https://images.pexels.com/photos/40751/running-runner-long-distance-fitness-40751.jpeg?cs=srgb&dl=woman-girl-silhouette-jogger-40751.jpg&fm=jpg',
    'https://cdn.dribbble.com/users/2429720/screenshots/6998651/googlefitexpositionprojects_2x.png',
    'https://images.pexels.com/photos/936611/pexels-photo-936611.jpeg?cs=srgb&dl=bowl-of-vegetable-salad-and-fruits-936611.jpg&fm=jpg',
    'https://images.pexels.com/photos/235922/pexels-photo-235922.jpeg?cs=srgb&dl=adventure-athlete-athletic-daylight-235922.jpg&fm=jpg',
    'https://images.pexels.com/photos/461428/pexels-photo-461428.jpeg?cs=srgb&dl=bamboo-bamboo-whisk-board-bowls-461428.jpg&fm=jpg',
  ];


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width;
    Constant.screenHeight = queryData.size.height;


    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }

      return result;
    }

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: SizedBox(
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
      ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: Constant.screenWidth ,
                    height: Constant.screenHeight * 1.5,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: Constant.screenWidth ,
                          height: (Constant.screenHeight/896) * 120.0,
                          color: Colors.white,
                        ),
                        Container(
                          width: Constant.screenWidth,
                          height: (Constant.screenHeight - (Constant.screenHeight/896) * 350.0),
                          color: Colors.grey[100],
                        ),
                        Container(
                          width: Constant.screenWidth,
                          height: (Constant.screenHeight )*0.7 ,
                          color: Colors.white,
                          child: _horizontalButtonView()
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: (Constant.screenHeight/812) * 170,
                    height: (Constant.screenHeight/812) * 200,
                    width: Constant.screenWidth,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, position) {
                          return Container(

                            width: (Constant.screenWidth /414) * 200,
                            height: (Constant.screenHeight * 812) / 200,
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    if(position == 0){

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Goals()));

//                                      Navigator.of(context).push(MaterialPageRoute(
//                                          builder: (_) => Goals()));
//                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Goals()), (route) => false);

                                    }else if(position == 1){

                                   Navigator.push(context, MaterialPageRoute(
                                       builder: (context) => GoogleFit()
                                   ));
                                    } else{

                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Goals()
                                      ));

                                    }
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .circular(12.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius
                                          .circular(12.0),
                                      child:  Image.network(imgList[position], fit: BoxFit.cover,
                                        width: Constant.screenWidth,
                                      ),
                                    ),
                                    elevation: 3,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                  Positioned(
                    left: (Constant.screenWidth/ 414) * 10,
                    top: (Constant.screenHeight/896) * 130,
                    height: (Constant.screenHeight/896) * 35,
                    child: Text("Today",
                      style: TextStyle(
                          fontFamily: "HKGrotesk-Bold",
                          fontSize: 16.0,
                          color: Palette.darkGrey
                      ),
                    ),
                  ),
                  Positioned(
                    top: (Constant.screenHeight/812) * 380,
                    height: (Constant.screenHeight/812) * 180,
                    width: Constant.screenWidth,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, position) {
                          return Container(
                            width: (Constant.screenWidth /414) * 100,
                            height: (Constant.screenHeight  / 812) * 150,
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {


//                                    Navigator.push(context, MaterialPageRoute(
//                                        builder: (context) => Goals()
//                                    ));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .circular(12.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius
                                          .circular(12.0),
                                      child:  Image.network(imgList[position], fit: BoxFit.cover,
                                        width: Constant.screenWidth,
                                      ),
                                    ),
                                    elevation: 0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                  Positioned(
                    left: (Constant.screenWidth/ 414) * 10,
                    top: (Constant.screenHeight/896) * 380,
                    height: (Constant.screenHeight/896) * 35,
                    child: Text("Quick Links",
                      style: TextStyle(
                          fontFamily: "HKGrotesk-Bold",
                          fontSize: 14.0,
                          color: Palette.darkGrey
                      ),
                    ),
                  ),
                  Positioned(
                      left: (Constant.screenWidth/ 414) * 80,
                      top: (Constant.screenHeight/896) * 52,
                      height: (Constant.screenHeight/896) * 35,
                      child: Center(
                        child: Text("LifePlus",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: "HKGrotesk-Regular",
                              color: Colors.green
                          ),)
                      )
                  ),
                  Positioned(
                      right: (Constant.screenWidth/ 414) * 19,
                      left: (Constant.screenWidth/ 414) * 350,
                      top: (Constant.screenHeight/896) * 52,
                      height: (Constant.screenHeight/896) * 35,
                      child: GestureDetector(
                        child: Icon(Icons.email,
                          color: Colors.grey,
                        ),
                        onTap: (){
//                          onTap_scaffoldKey.currentState.openDrawer();
                        },
                      )
                  ),
                  Positioned(
                    left: (Constant.screenWidth/ 414) * 20,
                    right: (Constant.screenWidth/ 414) * 20,
                    top: (Constant.screenHeight/896) * 540,
                    height: (Constant.screenHeight/896) * 75,
                    child:Container(
                    alignment: Alignment.bottomCenter,
                    width: ((queryData.size.width / 375) * 335),
                    height: ((queryData.size.width / 375) * 58),
                    child: new Theme(data: new ThemeData(
                      primaryColor: Palette.plum,
                      primaryColorDark: Palette
                          .darkishPurple,
                    ),
                      child: new  ButtonTheme(
                        minWidth: ((queryData.size.width / 375) * 335),
                        height: ((queryData.size.width / 375) * 50),
                        child:
                        new OutlineButton(
                          child: Container(
                              child:Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ((queryData.size.width /
                                            375) * 7),

                                        top: ((queryData.size.width /
                                            375) * 7),
                                        bottom: ((queryData.size
                                            .width /
                                            375) * 7),
                                        right: ((queryData.size
                                            .width /
                                            375) * 6)),
                                    child: ClipOval(
                                      child: Image.asset("assets/images/celebrity.jpg",
                                        fit: BoxFit.fill,
                                        width: ((queryData.size
                                            .width /
                                            375) * 35),
                                        height: ((queryData.size
                                            .width /
                                            375) * 35),
                                      ),
                                    ),
                                  ),
                                  Text( ' What’s on your mind ?          ',
                                      style:(TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'HK Grotesk',
                                        fontWeight: FontWeight.w300,
                                        color: Palette.darkGrey,
                                      )
                                      )
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ((queryData.size.width /
                                            375) * 50),

                                        top: ((queryData.size.width /
                                            375) * 7),
                                        bottom: ((queryData.size
                                            .width /
                                            375) * 7),
                                        right: ((queryData.size
                                            .width /
                                            375) * 6)),
                                    child: ClipOval(
                                      child: Icon(Icons.camera_enhance,
                                        color: Palette.darkGrey,),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePost()));
                          },
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .circular(25.0),
                          ),
                          borderSide: BorderSide(
                            //Color of the border
                            color: Palette.darkGrey,
                            width: 0.5, //width of the border
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
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
        itemCount:20,
        itemBuilder: (BuildContext context, int index) {
          return  GestureDetector(
            child:new Container(
                height: (Constant.screenHeight/896) *180,
                child: Column(
                  children: <Widget>[
                    Container(
                       height: (Constant.screenHeight/ 896 ) * 80,
                       child: Row(
                      children: <Widget>[
                        new Container(
                            width: (Constant.screenHeight /896) * 60,
                            height: (Constant.screenHeight/ 896 ) * 60,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                    )
                                )
                            )),
                        new Container(
                          margin: EdgeInsetsDirectional.only(start: (Constant.screenWidth /414)*30),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text("Rosiru Tharumal",
                                  style: TextStyle(fontSize: 14.0,
                                  color: Colors.black),),
                                Text("04/04/2020 9.00AM",
                                  style: TextStyle(fontSize: 14.0,
                                      color: Colors.blueGrey),),
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                    ),
                    Container(
                      height: (Constant.screenHeight/896) *80 ,
                      child:Column(
                        children: <Widget>[
                          Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey
                          ),)
                        ],
                      )
                    )
                  ],
                )
            ),
          );
        });
  }

}
