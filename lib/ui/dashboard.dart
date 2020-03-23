import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/nav_drawer.dart';
import 'package:health_plus/utils/Palette.dart';

import '../utils/constant.dart';
import 'create_post.dart';
import 'goals.dart';

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
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
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
                          color: Palette.lightBlue,
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

                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Goals()
                                      ));

                                    }else{

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
                    left: (Constant.screenWidth/ 414) * 08,
                    top: (Constant.screenHeight/896) * 55,
                    height: (Constant.screenHeight/896) * 35,
                    child: GestureDetector(
                      child: Icon(Icons.menu,
                      color: Palette.orangeColor,
                    ),
                    onTap: (){
//                      _scaffoldKey.currentState.openDrawer();
                    },
                    )
                  ),
                  Positioned(
                      left: (Constant.screenWidth/ 414) * 60,
                      top: (Constant.screenHeight/896) * 55,
                      height: (Constant.screenHeight/896) * 35,
                      child: Center(
                        child: Text("LifePlus",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "HKGrotesk-Regular",
                              color: Colors.green
                          ),)
                      )
                  ),
                  Positioned(
                      right: (Constant.screenWidth/ 414) * 19,
                      left: (Constant.screenWidth/ 414) * 350,
                      top: (Constant.screenHeight/896) * 50,
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
                                      child: CachedNetworkImage(
                                        imageUrl: 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                        placeholder: (context,
                                            url) => new CircularProgressIndicator(),
                                        errorWidget: (context, url,
                                            error) =>
                                        new Icon(Icons.error),
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
                                  Text( ' What’s on your mind ?                   ',
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
                height: (Constant.screenHeight/896) *80,
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
                        child: Text(""),

                      ),
                    ),
                  ],
                )
            ),
          );
        });
  }

}
