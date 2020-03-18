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
                               Navigator.push(context, MaterialPageRoute(
                                   builder: (context) => HealthInnerPage()
                               ));
                             },
                             child: Card(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius
                                     .circular(12.0),
                               ),
                               child: ClipRRect(
                                 borderRadius: BorderRadius
                                     .circular(12.0),
//                                 child:  Image.network(imgList[position], fit: BoxFit.cover,
//                                   width: Constant.screenWidth,
//                                 ),
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



