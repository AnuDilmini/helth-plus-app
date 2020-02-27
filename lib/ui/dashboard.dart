import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/nav_drawer.dart';
import 'package:health_plus/utils/Palette.dart';

import '../utils/constant.dart';

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
        endDrawer:  SizedBox(
            width: Constant.screenWidth,
            height: Constant.screenHeight,
            child: Theme(
              data: Theme.of(context).copyWith(
                // Set the transparency here
                canvasColor: Color.fromRGBO(255, 255, 255, 0.1), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
              ),
              child:Drawer(
                child: Container(
                  child:  NavDrawer(),
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
                    height: Constant.screenHeight,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: Constant.screenWidth ,
                          height: (Constant.screenHeight/896) * 166.0,
                          color: Colors.white,
                          child:Container(
                              height: (Constant.screenHeight/896) * 300,
                              width: (Constant.screenWidth/414) * 248,
                              child:Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only( top: (Constant.screenHeight/896) * 66 ,left: (Constant.screenWidth / 414) * 21),
                                    height: (Constant.screenHeight/896) * 150,
                                    child: Text("Welcome  Back,",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontFamily: "Montserrat-Light",
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only( top: (Constant.screenHeight/896) * 66 ),
                                    height: (Constant.screenHeight/896) * 150,
                                    child: Text(" John Doe",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontFamily: "Montserrat-Light",
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                        Container(
                          width: Constant.screenWidth,
                          height: (Constant.screenHeight - (Constant.screenHeight/896) * 166.0),
                          color: Palette.greyishBrown,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: (Constant.screenHeight /896) * 60,
                    left: (Constant.screenWidth / 414) * 250,
                    right:(Constant.screenWidth / 414) * 21,
                    height: (Constant.screenHeight /896) * 40,
                    child:  GestureDetector(
                      child: Container(
                        child: Image.asset("assets/images/navigator_white.png",
                          height: (Constant.screenHeight/896)  * 40,
                          width: Constant.screenWidth/15,
                          alignment:Alignment.centerRight ,
                          fit: BoxFit.contain,
                        ),),
                      onTap: (){
                        _scaffoldKey.currentState.openDrawer();
                        print("click");
                      },
                      onLongPress: (){
                        _scaffoldKey.currentState.openDrawer();
                        print("click ** ");
                      },
                    ),
                  ),
                  Positioned(
                    top: (Constant.screenHeight/896) * 287,
                    height: (Constant.screenHeight/896) * 200,
                    width: Constant.screenWidth,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, position) {
                          return Container(
                            width: (Constant.screenWidth * 26.4) / 100,
                            height: (Constant.screenHeight * 14.6) / 100,
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
//                                    print("Tapped --> " +
//                                        position.toString());
//                                    setOtherPageData(position);
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
                      left: (Constant.screenWidth/ 414) * 25,
                      right: (Constant.screenWidth/ 414) * 25,
                      top: (Constant.screenHeight/896) * 505,
                      height: (Constant.screenHeight/896) * 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(imgList, (index, url) {
                          return _current == index? Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Palette.lightGreen
                              )
                          ):
                          Container(
                              width: (Constant.screenWidth/ 414) * 29,
                              height: 3.0,
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Palette.grayColor
                              )
                          );
                        }),
                      )
                  ),
                  Positioned(
                    left: (Constant.screenWidth/ 414) * 19,
                    top: (Constant.screenHeight/896) * 243,
                    height: (Constant.screenHeight/896) * 35,
                    child: Text("Promotion",
                      style: TextStyle(
                          fontFamily: "Montserrat-Light",
                          fontSize: 17.0,
                          color: Palette.darkGrey
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

}
