
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

class HealthInner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HealthInnerLayout();
  }
}

class HealthInnerLayout extends State<HealthInner> {

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
          body:  SingleChildScrollView(
            child:Stack(
              children: <Widget>[
                Container(
                  height: Constant.screenHeight* 812,
                  width: Constant.screenWidth * 414,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF8333),
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
                        height: Constant.screenHeight * 812 - (Constant.screenHeight * 100),
//                        padding: EdgeInsetsDirectional.only(top: Constant.screenWidth* 75),
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
                  top: (Constant.screenHeight ) * 60,
                  width: Constant.screenWidth * 414,
                  child: Center(
                    child: Text("Health Tips",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: "Montserrat-Bold"
                      ),),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }

  _horizontalButtonView(){
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return  new Container(
              height: (Constant.screenHeight) * 200,
              child: Column(
                children: <Widget>[
                  Container(
                    height: (Constant.screenHeight) * 140,
                    width: Constant.screenWidth * 414,
                    margin: EdgeInsets.only( top: (Constant.screenHeight) * 4),
                    child: Image.asset("assets/images/health.jpg",
                      fit: BoxFit.fitWidth,
                      alignment:Alignment.center ,

                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top:Constant.screenWidth * 2, right: Constant.screenWidth* 22),
                      height: (Constant.screenHeight)  * 50,
                      width: Constant.screenWidth * 414,
                      child: Text("Summer health tips",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: "Montserrat-Regular",
                            color: Palette.darkGrey,
                            fontSize: 17
                        ),
                      )
                  ),
                ],
              )
          );
        });
  }

}


//import 'package:date_format/date_format.dart';
//import 'package:english_tea_shop/app_screens/home_ui/news_listview.dart';
//import 'package:english_tea_shop/main.dart';
//import 'package:english_tea_shop/model/home.dart';
//import 'package:english_tea_shop/screen_shapes/product_clipper.dart';
//import 'package:english_tea_shop/util/Constant.dart';
//import 'package:english_tea_shop/util/palette.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:intl/intl.dart';
//import 'package:ok_image/ok_image.dart';
//import 'package:flutter/scheduler.dart';
//
//
//
//class NewsInnerPageWidget extends StatefulWidget {
//
//  NewsInnerPageWidget(bool isSearch , String isSearchText){
//    NewsInnerPageBodyWidgetState._isSearch = isSearch;
//    NewsInnerPageBodyWidgetState._isSearchText = isSearchText;
//  }
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return NewsInnerPageBodyWidgetState();
//  }
//}
//
//class NewsInnerPageBodyWidgetState extends State<NewsInnerPageWidget> {
//  MediaQueryData queryData;
//  int screenHeight;
//  int screenWidth;
//  int topBarHeight;
//  int blendPageNumber;
//  News news;
//  String fromDateFormattedString;
//  String toDateFormattedString;
//  Widget contentWidget;
//  static bool _isSearch;
//  static String _isSearchText;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    queryData = MediaQuery.of(context);
//    screenHeight = queryData.size.height.round();
//    screenWidth = queryData.size.width.round();
//    topBarHeight = ((screenWidth * 77) / 375).round();
////    SystemChrome.setEnabledSystemUIOverlays([]);
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.transparent,
//        statusBarIconBrightness: Brightness.dark));
//
//    SingletonNewsClass singleton = SingletonNewsClass();
//    news = singleton.getNews();
//    var fromDate = (news.fromDate != null)
//        ? DateFormat("dd MMM yyyy").format(news.fromDate)
//        : 'not available';
//    var toDate = (news.toDate != null)
//        ? DateFormat("dd MMM yyyy").format(news.toDate)
//        : 'not available';
//
//    var contentTextHeight;
//    print('artcileText length ${news.artcileText.length}');
////       // print("image ===> ${Constant.ImageBaseURL}${news.image1Url}");
//
//
//    if(news.artcileText.contains("_x000D_")){
//      print("${news.artcileText}");
//      print("yes");
//      news.artcileText = '${news.artcileText.replaceAll('_x000D_',' ')}';
//    }
//
//    if (news.artcileText.length <= 500) {
//      contentTextHeight = (MediaQuery.of(context).size.height * 0.6);
//    } else if (news.artcileText.length <= 1000) {
//      contentTextHeight = (MediaQuery.of(context).size.height * 0.85);
//    } else if(news.artcileText.length <= 1550){
//      contentTextHeight = (MediaQuery.of(context).size.height * 1.1);
//    }else if(news.artcileText.length <= 1600){
//      contentTextHeight = (MediaQuery.of(context).size.height* 1.35);
//    }else if(news.artcileText.length <= 2000){
//      contentTextHeight = (MediaQuery.of(context).size.height* 1.6);
//    }else if(news.artcileText.length <= 2500){
//      contentTextHeight = (MediaQuery.of(context).size.height* 2.0);
//    }else if(news.artcileText.length <= 2800){
//      contentTextHeight = (MediaQuery.of(context).size.height* 2.1);
//    }else if(news.artcileText.length <= 3000){
//      contentTextHeight = (MediaQuery.of(context).size.height* 2.3);
//    }else{
//      contentTextHeight = (MediaQuery.of(context).size.height* 2.6);
//    }
//
//    var articleTitleHeight;
//    if (news.articleName.length <= 48) {
//      articleTitleHeight = MediaQuery.of(context).size.height * 0.06;
//    } else {
//      articleTitleHeight = MediaQuery.of(context).size.height * 0.09;
//    }
//
//    contentWidget = Container(
//          child: Text(
//            (news.artcileText != null )
//                ? '${news.artcileText}'
//                : ' Description not available',
//            textAlign: TextAlign.justify,
//            style: TextStyle(
//              fontFamily: 'HKGrotesk-Regular',
//              fontSize: 14.0,
//              color: Palette.textLightGray_color,
//            ),
//            overflow: TextOverflow.clip,
//          ),
//        );
//
//    return Scaffold(
//      body: Container(
//        width: queryData.size.width,
//        height: queryData.size.height,
//        decoration: BoxDecoration(
//            gradient: LinearGradient(
//          colors: [Palette.light_bg, Palette.drak_bg, Palette.drak_bg],
//          begin: Alignment.topCenter,
//          end: Alignment.bottomCenter,
//        )),
//        child: SafeArea(
//          child: Column(
//            children: <Widget>[
//              Expanded(
//                flex: topBarHeight,
//                child: Container(
////                  decoration: BoxDecoration(
////                      gradient: LinearGradient(
////                        colors: [Palette.light_bg, Palette.drak_bg, Palette.drak_bg],
////                        begin: Alignment.topCenter,
////                        end: Alignment.bottomCenter,
////                      )),
//                  height: topBarHeight * 0.7,
//                  child: _buildSearchBar(queryData, context),
//                ),
//              ),
//              Expanded(
//                flex: (screenHeight - topBarHeight + (topBarHeight * 0.7))
//                    .toInt(),
//                child: SingleChildScrollView(
//                  child: Column(
//                    children: <Widget>[
//                      Container(
//                        height: (MediaQuery.of(context).size.height * 0.55) +
//                            contentTextHeight +
//                            articleTitleHeight,
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Expanded(
//                              flex: (MediaQuery.of(context).size.height * 1.4)
//                                  .toInt(),
//                              child: Container(
//                                width: queryData.size.width,
//                                height: (MediaQuery.of(context).size.height * 1.4)
//                                    .toDouble(),
//                                decoration: BoxDecoration(
//                                  color: Colors.white,
//                                  borderRadius: new BorderRadius.only(
//                                    topLeft: const Radius.circular(8.0),
//                                    topRight: const Radius.circular(8.0),
//                                  ),
//                                ),
//                                child: Column(
//                                  children: <Widget>[
//                                    Container(
//                                      height:
//                                         (MediaQuery.of(context).size.width/600)*440,
//                                      width: MediaQuery.of(context).size.width,
//                                      child: ClipPath(
//                                        child: Card(
//                                          elevation: 0.0,
//                                          borderOnForeground: false,
//                                          margin: EdgeInsets.all(0.0),
//                                          clipBehavior: Clip.none,
//                                          child: ClipRRect(
//                                            borderRadius: BorderRadius.only(
//                                              topLeft: Radius.circular(4.0),
//                                              topRight: Radius.circular(4.0),
//                                            ),
//                                            child: OKImage(
//                                              url:
//                                                  '${Constant.ImageBaseURL}${news.image1Url}',
//                                              loadingWidget: Center(
//                                                child: Container(
//                                                  width: (MediaQuery.of(context)
//                                                          .size
//                                                          .width *
//                                                      0.03),
//                                                  height:
//                                                      (MediaQuery.of(context)
//                                                              .size
//                                                              .width *
//                                                          0.03),
//                                                 child:
//                                                      CircularProgressIndicator(),
//                                                ),
//                                              ),
//                                              errorWidget: Center(
//                                                child: Container(
//                                                  width: (MediaQuery.of(context)
//                                                          .size
//                                                          .width *
//                                                      0.03),
//                                                  height:
//                                                      (MediaQuery.of(context)
//                                                              .size
//                                                              .width *
//                                                          0.03),
//                                                  child: Icon(Icons.error),
//                                                ),
//                                              ),
////                                              width: screenWidth.toDouble(),
////                                              height: (screenWidth.toDouble()/300) * 220,
//                                              fit: BoxFit.fill,
//                                            ),
//                                          ),
//                                        ),
//                                        clipper: ProductClipper(),
//                                        clipBehavior: Clip.antiAlias,
//                                      ),
//                                    ),
//                                    Padding(
//                                      padding: EdgeInsets.only(
//                                          left: (MediaQuery.of(context)
//                                                  .size
//                                                  .width *
//                                              0.03),
//                                          right: (MediaQuery.of(context)
//                                                  .size
//                                                  .width *
//                                              0.03)),
//                                      child: Column(
//                                        children: <Widget>[
//                                          Container(
//                                            height: articleTitleHeight,
//                                            child: Center(
//                                              child: Text(
//                                                (news.articleName != null)
//                                                    ? "${news.articleName}"
//                                                    : '',
//                                                textAlign: TextAlign.center,
//                                                style: TextStyle(
//                                                    fontFamily:
//                                                        'HKGrotesk-SemiBold',
//                                                    color:
//                                                        Palette.dimgray_color,
//                                                    fontSize: 17.0),
//                                                overflow: TextOverflow.clip,
//                                                maxLines: 3,
//                                              ),
//                                            ),
//                                          ),
//                                          Container(
//                                            child: Column(
//                                              // mainAxisAlignment: MainAxisAlignment.start,
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.start,
//                                              children: <Widget>[
//                                                Container(
//                                                  height: contentTextHeight,
//                                                  width:
//                                                      ((MediaQuery.of(context)
//                                                                  .size
//                                                                  .height *
//                                                              0.5) *
//                                                          306 /
//                                                          110),
//                                                  padding: EdgeInsets.only(
//                                                      left: 2.0,
//                                                      right: 2.0,
//                                                      top: (MediaQuery.of(
//                                                                  context)
//                                                              .size
//                                                              .width *
//                                                          0.01)),
//                                                  child: Container(
//                                                    child:contentWidget,
//                                                  ),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  _buildSearchBar(MediaQueryData queryData, BuildContext context) {
////    SystemChrome.setEnabledSystemUIOverlays([]);
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.transparent,
//        statusBarIconBrightness: Brightness.dark));
//
//    return new Container(
//      child: new Row(
//        children: <Widget>[
//          Expanded(
//            flex: (queryData.size.width * 0.16).round(),
//            child: new Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  IconButton(
//                    icon: Icon(
//                      Icons.arrow_back_ios,
//                      color: Color.fromRGBO(99, 99, 99, 1),
//                    ),
//                    onPressed: () {
//                      SingletonNewsClass singleton = SingletonNewsClass();
//                      var index = singleton.getIndex();
//                      print('get index -----------> $index');
//
//                      if(_isSearch){
//
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) =>
//                                AmazonTea.otherHomePages(2, index,_isSearch, _isSearchText),
//                          ),
//                        );
//                      }else{
//                        Navigator.of(context).push(
//                          MaterialPageRoute(
//                            builder: (context) =>
//                                AmazonTea.otherHomePages(2, index,_isSearch, null),
//                          ),
//                        );
//                      }
//
//                    },
//                  ),
//                ]),
//          ),
//          Expanded(
//            flex: (queryData.size.width * 0.67).round(),
//            child: new Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  Text(
//                    "Highlights",
//                    textAlign: TextAlign.center,
//                    style: TextStyle(
//                        fontFamily: 'HKGrotesk-SemiBold',
//                        color: Palette.dimgray_color,
//                        fontSize: ((((queryData.size.height -
//                                            ((queryData.size.width / 375) *
//                                                92)) /
//                                        2) /
//                                    5) /
//                                64) *
//                            17),
//                    overflow: TextOverflow.clip,
//                    maxLines: 2,
//                  ),
//                ]),
//          ),
//          Expanded(
//            flex: (queryData.size.width * 0.16).round(),
//            child: new Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Container(),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget getBodyWidget(MediaQueryData queryData) {
//    var width = queryData.size.width;
//    var height = queryData.size.height;
//
//    return Container(
//      width: width,
//      height: height,
//      child: Stack(
//        fit: StackFit.expand,
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(top: (queryData.size.height * 30) / 100),
//            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                colors: [
//                  Color.fromRGBO(237, 247, 248, 1),
//                  Color.fromRGBO(154, 214, 222, 1),
//                ],
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//              ),
//            ),
//            child: Container(
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(8), color: Colors.white),
//              width: width,
//              height: height,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class BottomWaveClipper extends CustomClipper<Path> {
//  @override
//  Path getClip(Size size) {
//    var path = new Path();
//    path.lineTo(0.0, size.height - 73);
//
////    var firstControlPoint = new Offset((size.width / 375)*2, size.height-75);
////    var firstEndPoint = new Offset((size.width / 375)*4,size.height - 80);
////    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
////        firstEndPoint.dx, firstEndPoint.dy);
//
//    var firstControlPoint = Offset((size.width / 375) * 4, size.height - 82);
//    var firstEndPoint = Offset((size.width / 375) * 6, size.height - 80);
//    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//        firstEndPoint.dx, firstEndPoint.dy);
////
////    var thirdControlPoint =
////    Offset(size.width - (size.width / 4), size.height+100);
////    var thirdEndPoint = Offset((size.width/375)*367, size.height - 120);
////    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
////        thirdEndPoint.dx, thirdEndPoint.dy);
//
//    var thirdControlPoint =
//        Offset(size.width - (size.width / 2), size.height + 50);
//    var thirdEndPoint = Offset((size.width / 375) * 369, size.height - 80);
//    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
//        thirdEndPoint.dx, thirdEndPoint.dy);
//
//    var fourthControlPoint = Offset((size.width / 375) * 371, size.height - 82);
//    var fourthEndPoint = Offset((size.width / 375) * 375, size.height - 73);
//    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
//        fourthEndPoint.dx, fourthEndPoint.dy);
//
////    var fifthControlPoint =
////    Offset((size.width / 375)*373, size.height-75);
////    var fifthEndPoint = Offset(size.width, size.height - 73);
////    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
////        fifthEndPoint.dx, fifthEndPoint.dy);
//
//    path.lineTo(size.width, size.height - 73);
//    path.lineTo(size.width, 0.0);
//    path.close();
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
//}