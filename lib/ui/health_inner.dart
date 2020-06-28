import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:health_plus/screen_shape/product_clip.dart';
import 'package:health_plus/ui/health_tips.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'package:ok_image/ok_image.dart';

import 'discover.dart';

class HealthInnerPage extends StatefulWidget {

  HealthInnerPage({Key key, this.title, this.data}) : super(key: key);
  final String title;
  var data;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HealthInnerWidget();
  }
}

class HealthInnerWidget extends State<HealthInnerPage> {
  MediaQueryData queryData;
  double screenHeight;
  double screenWidth;
  double topBarHeight;
  int blendPageNumber;
  String fromDateFormattedString;
  String toDateFormattedString;
  Widget contentWidget;
  static bool _isSearch;
  static String _isSearchText;
  var arrayData ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arrayData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width / 414;
    Constant.screenHeight = queryData.size.height/812;


//    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    contentWidget = Container(
      child: Text("It's recommended that you eat at least 5 portions of a variety of fruit and veg every day. They can be fresh, frozen, canned, dried or juiced.\nGetting your 5 A Day is easier than it sounds. Why not chop a banana over your breakfast cereal, or swap your usual mid-morning snack for a piece of fresh fruit?\nA portion of fresh, canned or frozen fruit and vegetables is 80g. A portion of dried fruit (which should be kept to mealtimes) is 30g.\nA 150ml glass of fruit juice, vegetable juice or smoothie also counts as 1 portion, but limit the amount you have to no more than 1 glass a day as these drinks are sugary and can damage your teeth.",
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontFamily: 'HKGrotesk-Regular',
          fontSize: 14.0,
          color: Palette.grayColor,
        ),
        overflow: TextOverflow.clip,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
        Container(
          width: Constant.screenWidth * 414,
          height: Constant.screenHeight * 1100,
          color: Palette.orangeLight,
          child: Column(
            children: <Widget>[
            Container(
              width: Constant.screenWidth * 414,
              height: Constant.screenHeight * 100,
              color: Palette.orangeLight,

            ),
            Container(
              width: Constant.screenWidth * 414,
              height: Constant.screenHeight*1000,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(8.0),
                    topRight: const Radius.circular(8.0),
                  ),
                ),
                child:Column(
                  children: <Widget>[
                    Container(
                      width: Constant.screenWidth * 414,
                      height: Constant.screenHeight*300,
                      child:  ClipPath(
                        child: Card(
                          elevation: 0.0,
                          borderOnForeground: false,
                          margin: EdgeInsets.all(0.0),
                          clipBehavior: Clip.none,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                            child: OKImage(
                              url:
                              '${arrayData['template'][0]['link']}',
                              loadingWidget: Center(
                                child: Container(
                                  child:
                                  CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: Center(
                                child: Container(
                                  width: (MediaQuery.of(context)
                                      .size
                                      .width *
                                      0.03),
                                  height:
                                  (MediaQuery.of(context)
                                      .size
                                      .width *
                                      0.03),
                                  child: Icon(Icons.error),
                                ),
                              ),
//                                              width: screenWidth.toDouble(),
//                                              height: (screenWidth.toDouble()/300) * 220,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        clipper: ProductClipper(),
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      width: Constant.screenWidth * 414,
                      height: Constant.screenHeight *100,
                      child: Center(
                        child: Text(
                        "${arrayData['name']}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "HKGrotesk-Regular",
                          color: Colors.black87,
                          fontSize: 18,

                      ),
                      ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      width: Constant.screenWidth * 414,
                      height: Constant.screenHeight *100,
                      child: Center(
                        child: Text(
                          "${arrayData['template'][2]['text']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "HKGrotesk-Regular",
                            color: Palette.grayColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      width: Constant.screenWidth * 414,
                      height: Constant.screenHeight *200,
                      child: _horizontalButtonView(),
                    ),

                  ],
                )
            ),
          ]
        ),
        ),
          Positioned(
            left: Constant.screenWidth* 19,
            top: Constant.screenHeight *35,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Discover()));

              },
            ),
          ),
          Positioned(
            left: Constant.screenWidth*150,
            top: Constant.screenHeight *50,
            child:  Center(
              child: Text(
                "Health Tip",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'HKGrotesk-SemiBold',
                    color: Colors.white,
                    fontSize: 17),
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
            )
          ),
        ],
      )
      ),
    );
  }

  //  ['template'][0]['link']

  _horizontalButtonView(){
    return ListView.builder(
        padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 10.0),
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            margin: EdgeInsets.only(top: Constant.screenWidth * 2,
                right: Constant.screenWidth * 22),
            height: (Constant.screenHeight) * 500,
            width: Constant.screenWidth * 414,
            child: Text("${arrayData['template'][3]['text']}",
              textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "HKGrotesk-Regular",
                    color: Palette.darkGrey,
                    fontSize: 14
              ),
            )
          );
        });
  }
}

