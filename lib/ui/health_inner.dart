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

//  NewsInnerPageWidget(bool isSearch , String isSearchText){
//    NewsInnerPageBodyWidgetState._isSearch = isSearch;
//    NewsInnerPageBodyWidgetState._isSearchText = isSearchText;
//  }

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
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
      body: Stack(
        children: <Widget>[
        Container(
          width: Constant.screenWidth * 414,
          height: Constant.screenHeight * 812,
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
              height: Constant.screenHeight*620,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(8.0),
                    topRight: const Radius.circular(8.0),
                  ),
                ),
                child:Column(
                  children: <Widget>[
                    ClipPath(
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
                            'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                            loadingWidget: Center(
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
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      width: Constant.screenWidth * 414,
                      height: Constant.screenHeight *300,
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

    );
  }

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
            child: Center(
              child:Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use itIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Where does it come from?Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et MalorumThe Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorumby Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation textAlign: TextAlign.left",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "HKGrotesk-Regular",
                    color: Palette.darkGrey,
                    fontSize: 14
                ),
              ),
            )
          );
        });
  }
}

