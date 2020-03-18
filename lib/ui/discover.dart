import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/ui/health_inner.dart';
import 'package:health_plus/utils/constant.dart';

class Discover extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiscoverLayout();
  }
}

class DiscoverLayout extends State<Discover> {

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
                 height: (Constant.screenHeight * 812) * 1.3,
                 width: Constant.screenWidth * 414,
               ),
             Positioned(
                 top: Constant.screenHeight  *55,
                 left: Constant.screenWidth * 21,
                 width: Constant.screenWidth * 200,
                 height: Constant.screenHeight  * 50,
                 child:Text("Discover",
                 style: TextStyle(
                   fontSize: 22.0,
                   color: Colors.black,
                   fontFamily: "HKGrotesk-Bold"
                 ),)
             ),
             Positioned(
                 top: Constant.screenHeight  *110,
                 left: Constant.screenWidth * 21,
                 width: Constant.screenWidth * 200,
                 height: Constant.screenHeight  * 50,
                 child:Text("Active Challenges",
                   style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,
                       fontFamily: "HKGrotesk-Bold"
                   ),)
             ),
             Positioned(
               top: (Constant.screenHeight) * 140,
               height: (Constant.screenHeight) * 180,
//             left: Constant.screenWidth *15,
               width: Constant.screenWidth * 414,
               child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: 1,
                     itemBuilder: (context, position) {
                       return Card(
                         margin: EdgeInsets.only(left: 15.0),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius
                               .circular(8.0),
                         ),
                         child: ClipRRect(
                           borderRadius: BorderRadius
                               .circular(6.0),
                           child: Container(
                               color: listColor[position],
                               width: Constant.screenWidth * 160,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Container(
                                     decoration: BoxDecoration(
                                     borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                                     border:  Border.all(color: Colors.black,
                                     width: 1.0)
                                     ),
                                     margin: EdgeInsets.only(top: 10.0,left: 10.0),
                                     height: Constant.screenHeight * 20,
                                     width: Constant.screenWidth * 75,
                                     child: Center(
                                       child: Text("Challenge",
                                         style: TextStyle(
                                             fontSize: 10.0,
                                             color: Colors.black,
                                             fontFamily: "HKGrotesk-Bold"
                                         ),
                                       ),
                                     )
                                   ),
                                   Container(
                                     margin: EdgeInsets.only(top: 3.0,left: 10.0),
                                     child: Text("Dhaka to Jaflong",
                                       style: TextStyle(fontSize: 14.0,
                                           color: Colors.black,
                                           fontFamily: "HKGrotesk-Bold"
                                       ),
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.only(top: 3.0,left: 10.0),
                                     child: Text("Step Challenge",
                                       style: TextStyle(fontSize: 12.0,
                                           color: Colors.grey,
                                           fontFamily: "HKGrotesk-Bold"
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             )
                         ),
                         elevation: 3,
                       );
                     }
                 ),
             ),
             Positioned(
                 top: Constant.screenHeight  * 350,
                 left: Constant.screenWidth * 21,
                 width: Constant.screenWidth * 200,
                 height: Constant.screenHeight  * 50,
                 child:Text("Subcription Plans",
                   style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,
                       fontFamily: "HKGrotesk-Bold"
                   ),)
             ),
             Positioned(
               top: (Constant.screenHeight) * 380,
               height: (Constant.screenHeight) * 180,
//             left: Constant.screenWidth *15,
               width: Constant.screenWidth * 414,
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: 2,
                   itemBuilder: (context, position) {
                     return Card(
                       margin: EdgeInsets.only(left: 15.0),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius
                             .circular(8.0),
                       ),
                       child: ClipRRect(
                           borderRadius: BorderRadius
                               .circular(6.0),
                           child: Container(
                             color: listColor[position+1],
                             width: Constant.screenWidth * 160,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Container(
                                     decoration: BoxDecoration(
                                         borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                                         border:  Border.all(color: Colors.black,
                                             width: 1.0)
                                     ),
                                     margin: EdgeInsets.only(top: 10.0,left: 10.0),
                                     height: Constant.screenHeight * 20,
                                     width: Constant.screenWidth * 75,
                                     child: Center(
                                       child: Text("Plans",
                                         style: TextStyle(
                                             fontSize: 10.0,
                                             color: Colors.black,
                                             fontFamily: "HKGrotesk-Bold"
                                         ),
                                       ),
                                     )
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: 3.0,left: 10.0),
                                   child: Text("Life Plus Regular",
                                     style: TextStyle(fontSize: 14.0,
                                         color: Colors.black,
                                         fontFamily: "HKGrotesk-Bold"
                                     ),
                                   ),
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: 3.0,left: 10.0),
                                   child: Text("Daily 26",
                                     style: TextStyle(fontSize: 12.0,
                                         color: Colors.grey,
                                         fontFamily: "HKGrotesk-Bold"
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           )
                       ),
                       elevation: 3,
                     );
                   }
               ),

             ),
             Positioned(
                 top: Constant.screenHeight  * 590,
                 left: Constant.screenWidth * 21,
                 width: Constant.screenWidth * 200,
                 height: Constant.screenHeight  * 50,
                 child:Text("Health Online",
                   style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,
                       fontFamily: "HKGrotesk-Bold"
                   ),)
             ),
             Positioned(
               top: (Constant.screenHeight) * 630,
               height: (Constant.screenHeight) * 180,
//             left: Constant.screenWidth *15,
               width: Constant.screenWidth * 414,
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: 5,
                   itemBuilder: (context, position) {
                     return Card(
                       margin: EdgeInsets.only(left: 15.0),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius
                             .circular(8.0),
                       ),
                       child: ClipRRect(
                           borderRadius: BorderRadius
                               .circular(6.0),
                           child: Container(
                             color: listColor[position],
                             width: Constant.screenWidth * 160,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Container(
                                     decoration: BoxDecoration(
                                         borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                                         border:  Border.all(color: Colors.black,
                                             width: 1.0)
                                     ),
                                     margin: EdgeInsets.only(top: 10.0,left: 10.0),
                                     height: Constant.screenHeight * 20,
                                     width: Constant.screenWidth * 75,
                                     child: Center(
                                       child: Text("Health",
                                         style: TextStyle(
                                             fontSize: 10.0,
                                             color: Colors.black,
                                             fontFamily: "HKGrotesk-Bold"
                                         ),
                                       ),
                                     )
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: 3.0,left: 10.0),
                                   child: Text("Doctor Service",
                                     style: TextStyle(fontSize: 14.0,
                                         color: Colors.black,
                                         fontFamily: "HKGrotesk-Bold"
                                     ),
                                   ),
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: 3.0,left: 10.0),
                                   child: Text("Daily 26",
                                     style: TextStyle(fontSize: 12.0,
                                         color: Colors.grey,
                                         fontFamily: "HKGrotesk-Bold"
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           )
                       ),
                       elevation: 3,
                     );
                   }
               ),

             ),
             Positioned(
                 top: Constant.screenHeight  * 840,
                 left: Constant.screenWidth * 21,
                 width: Constant.screenWidth * 200,
                 height: Constant.screenHeight  * 50,
                 child:Text("Health Plans",
                   style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,
                       fontFamily: "HKGrotesk-Bold"
                   ),)
             ),
             Positioned(
               top: (Constant.screenHeight) * 870,
               height: (Constant.screenHeight) * 180,
//             left: Constant.screenWidth *15,
               width: Constant.screenWidth * 414,
               child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: 5,
                   itemBuilder: (context, position) {
                     return Card(
                       margin: EdgeInsets.only(left: 15.0),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius
                             .circular(8.0),
                       ),
                       child: ClipRRect(
                           borderRadius: BorderRadius
                               .circular(6.0),
                           child: Container(
                             color: listColor[position],
                             width: Constant.screenWidth * 160,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Container(
                                     decoration: BoxDecoration(
                                         borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                                         border:  Border.all(color: Colors.black,
                                             width: 1.0)
                                     ),
                                     margin: EdgeInsets.only(top: 10.0,left: 10.0),
                                     height: Constant.screenHeight * 20,
                                     width: Constant.screenWidth * 75,
                                     child: Center(
                                       child: Text("Diet",
                                         style: TextStyle(
                                             fontSize: 10.0,
                                             color: Colors.black,
                                             fontFamily: "HKGrotesk-Bold"
                                         ),
                                       ),
                                     )
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: 3.0,left: 10.0),
                                   child: Text("8 Weeks",
                                     style: TextStyle(fontSize: 14.0,
                                         color: Colors.black,
                                         fontFamily: "HKGrotesk-Bold"
                                     ),
                                   ),
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: 3.0,left: 10.0),
                                   child: Text("Daily 26",
                                     style: TextStyle(fontSize: 12.0,
                                         color: Colors.grey,
                                         fontFamily: "HKGrotesk-Bold"
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           )
                       ),
                       elevation: 3,
                     );
                   }
               ),

             ),
           ]
       )
      )
      )
    );
  }

  Card getStructuredGridCell(int position) {
    // print("cell position $position");
    // print("----Image----${Constant.ImageBaseURL+blendDataList[position].dryLeafImgUrl}" );
    return new Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
//        child: CachedNetworkImage(
//          imageUrl: Constant.ImageBaseURL+blendDataList[position].infusionDesImgUrl ?? "http://192.168.100.71/amazon_tea_etf/public/onedrive_contents/blends/blend_photos/01 - QUADRANT - Style No - BR290901 - SFETSIH0000001 - English Breakfast.JPG",
//          placeholder: (context, url) => new CircularProgressIndicator(),
//          errorWidget: (context, url, error) => new Icon(Icons.error),
//          width: (queryData.size.width/2)-30,
//          fit: BoxFit.fill,
//        ),
//        child: OKImage(
//          url: Constant.ImageBaseURL+blendDataList[position].dryLeafImgUrl ,
//          loadingWidget: Center(
//            child: Container(
//              width: ((queryData.size.width/2)*
//                  0.06),
//              height: ((queryData.size.width/2)*
//                  0.06),
//              child:
//              CircularProgressIndicator(),
//            ),
//          ),
//          errorWidget: Center(
//            child: Container(
//              width: ((queryData.size.width/2)*
//                  0.03),
//              height: ((queryData.size.width/2)*
//                  0.03),
//              child: Icon(Icons.error),
//            ),
//          ),
//          width: (queryData.size.width/300)*200,
//          height: (queryData.size.width/300)*200,
//          fit: BoxFit.fill,
//        ),
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
        scrollDirection: Axis.horizontal,
        itemCount:20,
        itemBuilder: (BuildContext context, int index) {
          return  GestureDetector(
            child:getStructuredGridCell(index),
//            new Container(
//                height: (Constant.screenHeight/896) *80,
//                child: Row(
//                  children: <Widget>[
//                    new Container(
//                        width: (Constant.screenHeight /896) * 60,
//                        height: (Constant.screenHeight/ 896 ) * 60,
//                        decoration: new BoxDecoration(
//                            shape: BoxShape.circle,
//                            image: new DecorationImage(
//                                fit: BoxFit.fill,
//                                image: new NetworkImage(
//                                  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//                                )
//                            )
//                        )),
//                    new Container(
//                      margin: EdgeInsetsDirectional.only(start: (Constant.screenWidth /414)*30),
//                      child: Center(
//                        child: Text(""),
//
//                      ),
//                    ),
//                  ],
//                )
//            ),
          );
        });
  }
}



