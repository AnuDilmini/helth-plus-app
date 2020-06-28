import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/ui/health_inner.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'dart:async';
import 'dart:convert';

class AllPlans extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllPlansLayout();
  }
}

class AllPlansLayout extends State<AllPlans> {

  MediaQueryData queryData;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  ];


  var listColor = [
    Colors.amber,
    Colors.pink[200],
    Colors.blue[200],
    Colors.green,
    Colors.brown,
    Colors.deepOrangeAccent,
    Colors.purple,
    Colors.indigo,
    Colors.grey,
    Colors.red,
  ];


  @override
  void initState() {
    loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width / 414;
    Constant.screenHeight = queryData.size.height / 812;

    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            body:  SingleChildScrollView(
                child:Stack(
                    children: <Widget>[
                      Container(
                        height: (Constant.screenHeight * 812) * 13,
                        width: Constant.screenWidth * 414,
                      ),
                      Positioned(
                          top: Constant.screenHeight  * 70,
                          left: Constant.screenWidth * 21,
                          width: Constant.screenWidth * 200,
                          height: Constant.screenHeight  * 50,
                          child:Text("All Plans",
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                                fontFamily: "HKGrotesk-Bold"
                            ),)
                      ),
                      Positioned(
                        top: (Constant.screenHeight) * 100,
                        height: (Constant.screenHeight) * 700,
//                      left: Constant.screenWidth *15,
                        width: Constant.screenWidth * 414,
                          child:  FutureBuilder(
                              future: DefaultAssetBundle.of(context).loadString("assets/data.json"),
                              builder: (context, snapshot) {

                                if(!snapshot.hasData) {
                                  return Center(
                                      child: Container(
                                      height: 29,
                                    child: CircularProgressIndicator(),
                                      ),
                                  );
                                }
                                // Decode the JSON
                                var new_data = json.decode(
                                    snapshot.data.toString());
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: new_data.length,
                                    itemBuilder: (BuildContext context,
                                        position) {

                                      var array =json.decode(
                                          new_data[position]['array '].toString());

                                      log("array *****q w***${array['template'][0]['link']}");
//                                      log("array ********${new_data[position]['array '][0]}");
                                      print("new_data ********$new_data");
                                      return GestureDetector(
                                        child: Card(
                                          margin: EdgeInsets.only(left: 15.0, bottom: 15, right: 15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius
                                                .circular(8.0),
                                          ),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius
                                                  .circular(6.0),
                                              child: Container(
                                                decoration: new BoxDecoration(
                                                  color: Palette.white,
                                                  image:  DecorationImage(
                                                    image: NetworkImage("${array['template'][0]['link']}"),
                                                      fit: BoxFit.fitWidth,
                                                  ),
                                                ),
//                                                color: listColor[position],
                                                width: Constant.screenWidth *
                                                    160,
                                                height: Constant.screenHeight * 250,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: <Widget>[
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: new BorderRadius
                                                                .all(
                                                                const Radius
                                                                    .circular(
                                                                    10.0)),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1.0)
                                                        ),
                                                        margin: EdgeInsets.only(
                                                            top: 10.0,
                                                            left: 10.0),
                                                        height: Constant
                                                            .screenHeight * 20,
                                                        width: Constant
                                                            .screenWidth * 75,
                                                        child: Center(
                                                          child: Text(
                                                            "Diabetics",
                                                            style: TextStyle(
                                                                fontSize: 10.0,
                                                                color: Colors
                                                                    .black,
                                                                fontFamily: "HKGrotesk-Bold"
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 3.0, left: 10.0),
                                                      child: Text("${new_data[position]['week_names ']}",
                                                        style: TextStyle(
                                                            fontSize: 18.0,
                                                            color: Colors.black,
                                                            fontFamily: "HKGrotesk-Bold"
                                                        ),
                                                      ),
                                                    ),
//                                                    Container(
//                                                      margin: EdgeInsets.only(
//                                                          top: 3.0, left: 10.0),
//                                                      child: Text("Daily 26",
//                                                        style: TextStyle(
//                                                            fontSize: 12.0,
//                                                            color: Colors.grey,
//                                                            fontFamily: "HKGrotesk-Bold"
//                                                        ),
//                                                      ),
//                                                    )
                                                  ],
                                                ),
                                              )
                                          ),
                                          elevation: 3,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(
                                              builder: (context) =>
                                                  HealthInnerPage(data: array)
                                          ));
                                        },
                                      );
                                    }
                                );
                              }
                              )
                      )

                    ]
                )
            )
        )
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }
  Future<String> getData() async {

    var jsonString = loadAsset();

    var myData = json.decode(jsonString.toString());
    log("$myData **123*************");
  }

}



