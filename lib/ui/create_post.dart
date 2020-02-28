
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

class CreatePost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreatePostLayout();
  }
}

class CreatePostLayout extends State<CreatePost> {

  MediaQueryData queryData;
  bool isClickPost = false;

  TextEditingController postTextController = TextEditingController();
  final TextEditingController commentTextController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark
    ));

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width ;
    Constant.screenHeight = queryData.size.height;
    double topBarHeight = (Constant.screenHeight /817) * 80;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: Constant.screenWidth,
            height: Constant.screenHeight,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8330),
                    Color(0xFFFC663C),
                    Color(0xFFFF3F1A),],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
            child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Container(
                        width: Constant.screenWidth,
                        height: topBarHeight ,
                        child: Container(
                          width: topBarHeight.toDouble(),
                          child:
                          new Row(
                            children: <Widget>[
                              Expanded(
                                flex: (queryData.size.width * 0.16).round(),
                                child: new Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: <Widget>[
                                      IconButton(
                                          icon: new Icon(
                                            Icons.arrow_back,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                          }
                                      ),
                                    ]
                                ),
                              ),
                              Expanded(
                                flex: (queryData.size.width * 0.67).round(),
                                child: new Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Text(
                                        "Update Status",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'HKGrotesk-SemiBold',
                                            color: Palette.grayColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17.0
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                              Expanded(
                                flex: (queryData.size.width * 0.16).round(),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
//                                        if (!isClickPost) {
////                                            print("isClick");
//                                          validationsBeforePost(context);
//                                          isClickPost = true;
//                                        }
                                      },
                                      child: Text("Post",
                                        style: TextStyle(
                                            fontFamily: 'HKGrotesk-SemiBold',
                                            color: Palette.grayColor,
                                            fontSize: ((((queryData.size
                                                .height -
                                                ((queryData.size.width /
                                                    375) * 92)) / 2) / 5) /
                                                64) * 17
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                   Container(
                     height: (Constant.screenHeight /817) * 600,
                     decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(8.0),
                              topRight: const Radius.circular(8.0))
                      ),
                     child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ((queryData.size
                                          .width / 375) * 20),
                                      top: ((queryData.size
                                          .width / 375) *
                                          15)),
                                  child:
                                  ClipOval(
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
                                      placeholder: (context,
                                          url) => new CircularProgressIndicator(),
                                      errorWidget: (context,
                                          url, error) =>
                                      new Icon(Icons.error),
                                      fit: BoxFit.fill,
                                      width: ((queryData.size
                                          .width / 375) * 40),
                                      height: ((queryData.size
                                          .width / 375) * 40),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets
                                          .only(
                                          left: ((queryData.size.width /
                                              375) * 10),
                                          top: ((queryData
                                              .size.width /
                                              375) * 15)),
                                      child: Text(
                                        "Anushika",
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'HK Grotesk',
                                          fontWeight: FontWeight
                                              .w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets
                                                .only(
                                                left: ((queryData
                                                    .size
                                                    .width /
                                                    375) *
                                                    10),
                                                top: ((queryData
                                                    .size
                                                    .width /
                                                    375) *
                                                    5)),
                                            child: Container(
                                              width: ((queryData.size.width /
                                                  375) * 90),
                                              height: ((queryData.size.width /
                                                  375) * 30),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Color.fromRGBO(
                                                          246, 246, 246, 1)),
                                                  borderRadius:
                                                  new BorderRadius.all(
                                                      const Radius.circular(
                                                          30.0))
                                              ),
                                              child: Padding(
                                                  padding: EdgeInsets
                                                      .only(
                                                      left: ((queryData
                                                          .size
                                                          .width /
                                                          375) *
                                                          20),
                                                      top: ((queryData
                                                          .size
                                                          .width /
                                                          375) *
                                                          2),
                                                      right: ((queryData
                                                          .size
                                                          .width /
                                                          375) *
                                                          0),
                                                      bottom: ((queryData
                                                          .size
                                                          .width /
                                                          375) *
                                                          2)
                                                  ),
//                                                  child: DropdownButtonHideUnderline(
//                                                    child: new DropdownButton<
//                                                        PostActive>(
//                                                      iconSize: ((queryData
//                                                          .size.width / 375) *
//                                                          0),
//                                                      value: seletedPostActiveID,
//                                                      elevation: 0,
//                                                      hint: Text("Only me",
////                                                        Text("Select from ",
//                                                        style: TextStyle(
//                                                          fontFamily: 'HK Grotesk',
//                                                          fontWeight: FontWeight
//                                                              .w500,
//                                                          fontSize: 12,
//                                                        ),),
//                                                      items: listPostActive
//                                                          .map((
//                                                          PostActive user) {
//                                                        return new DropdownMenuItem<
//                                                            PostActive>(
//                                                          value: user,
//                                                          child: new Text(
//                                                            user
//                                                                .postActiveName,
//                                                            style: new TextStyle(
//                                                              color: Colors
//                                                                  .black,
//                                                              fontFamily: 'HK Grotesk',
//                                                              fontWeight: FontWeight
//                                                                  .w500,
//                                                              fontSize: ((((queryData
//                                                                  .size
//                                                                  .height -
//                                                                  ((queryData
//                                                                      .size
//                                                                      .width /
//                                                                      375) *
//                                                                      92)) *
//                                                                  0.6) / 6) /
//                                                                  64) * 12,
//                                                            ),
//                                                          ),
//                                                        );
//                                                      }).toList(),
//                                                    ),
//                                                  )
                                              ),
                                            )
                                        ),
                                        Padding(
                                            padding: EdgeInsets
                                                .only(
                                                left: ((queryData
                                                    .size
                                                    .width /
                                                    375) *
                                                    10),
                                                top: ((queryData
                                                    .size
                                                    .width /
                                                    375) *
                                                    5)),
                                            child: Container(
                                              width: ((queryData.size.width /
                                                  375) * 90),
                                              height: ((queryData.size.width /
                                                  375) * 30),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Color.fromRGBO(
                                                          246, 246, 246, 1)),
                                                  borderRadius:
                                                  new BorderRadius.all(
                                                      const Radius.circular(
                                                          30.0))
                                              ),
                                              child: Padding(
                                                  padding: EdgeInsets
                                                      .only(
                                                    left: ((queryData
                                                        .size
                                                        .width /
                                                        375) *
                                                        21),
                                                    right: ((queryData
                                                        .size
                                                        .width /
                                                        375) *
                                                        2),
                                                  ),
//                                                  child: DropdownButtonHideUnderline(
//                                                      child: new DropdownButton<
//                                                          AllPostType>(
//                                                        value: seletedPostType,
//                                                        iconSize: ((queryData
//                                                            .size.width /
//                                                            375) * 0),
//                                                        elevation: 0,
//                                                        hint: Text(
//                                                          "Select from ",
//                                                          style: TextStyle(
//                                                            fontFamily: 'HK Grotesk',
//                                                            fontWeight: FontWeight
//                                                                .w500,
//                                                            fontSize: ((((queryData
//                                                                .size.height -
//                                                                ((queryData
//                                                                    .size
//                                                                    .width /
//                                                                    375) *
//                                                                    92)) *
//                                                                0.6) / 6) /
//                                                                64) * 10,
//                                                          ),),
//                                                        items: listPostTypes
//                                                            .map((
//                                                            AllPostType user) {
//                                                          return new DropdownMenuItem<
//                                                              AllPostType>(
//                                                            value: user,
//                                                            child: new Text(
//                                                              user.name,
//                                                              style: new TextStyle(
//                                                                color: Colors
//                                                                    .black,
//                                                                fontFamily: 'HK Grotesk',
//                                                                fontWeight: FontWeight
//                                                                    .w500,
//                                                                fontSize: 12.0,
//                                                              ),
//                                                            ),
//                                                          );
//                                                        }).toList(),
//                                                        onChanged: (
//                                                            AllPostType newValue) {
//                                                          setState(() {
//                                                            seletedPostType =
//                                                                newValue;
//                                                          });
//                                                        },
//                                                      )
//                                                  )
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ],
                                ),
//                                Padding(
//                                  padding: EdgeInsets.only(
//                                      top: (queryData.size.width / 375) * 25,
//                                      left: (queryData.size.width / 375) *
//                                          30),
//                                  child: Column(
//                                    children: <Widget>[
//                                      GestureDetector(
//                                        child:  Image.asset("assets/images/photo_icon.jpg",
//                                          width: ((queryData.size
//                                              .width / 375) * 44),
//                                          height: ((queryData.size
//                                              .width / 375) * 44),
//                                        ),
//                                        onTap: () {
//                                          FocusScope.of(context).requestFocus(new FocusNode());
//
////                                          new Future.delayed(
////                                            const Duration(milliseconds: 300),
////                                                () =>selectImageOrVideo(context),
////                                          );
//                                        },
//                                      ),
//                                      GestureDetector(
//                                        child: Text("Photo / Video",
//                                          style: TextStyle(
//                                            fontSize: ((((queryData.size
//                                                .height -
//                                                ((queryData.size.width /
//                                                    375) * 92)) * 0.6) / 6) /
//                                                64) * 10,
//                                            fontFamily: 'HK Grotesk',
//                                            fontWeight: FontWeight.w500,
//                                            color: Palette
//                                                .darkishPurple,
//                                          ),),
//                                        onTap: () {
////                                          FocusScope.of(context).requestFocus(new FocusNode());
////                                          new Future.delayed(
////                                            const Duration(milliseconds: 300),
////                                                () =>selectImageOrVideo(context),
////                                          );
//
//                                        },
//                                      )
//                                    ],
//                                  ),
//                                ),
                              ],
                            ),
                            isClickPost?
                            Padding(
                                padding: EdgeInsets.only(top: (queryData.size.width / 375) * 20),
                                child:Center(
                                    child: new Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: SpinKitChasingDots(
                                                key: Key("loading"),
                                                size: 70.0,
                                                itemBuilder: (_, int index) {
                                                  return DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: index.isEven ? Color.fromRGBO(67, 58, 141, 100.0) : Color.fromRGBO(154, 214, 222, 100.0),
                                                        borderRadius: new BorderRadius.all(Radius.circular(50.0))
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                    )
                                )
                            ):
                            Padding(
                                padding: EdgeInsets.only(
                                    top: (queryData.size.width / 375) * 20),
                                child: Container(

                                    width: (queryData.size.width / 375) * 335,
                                    height: (queryData.size.width / 375) *
                                        400,
                                    child: Column(
                                      children: <Widget>[
                                        TextField(
                                          controller: postTextController,
                                          autocorrect: true,
                                          autofocus: true,
                                          maxLines: 8,
                                          decoration: InputDecoration
                                              .collapsed(
                                            hintText: 'What’s on your mind ?',
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'HK Grotesk',
                                              fontWeight: FontWeight.w500,
                                              color: Palette.grayColor,
                                            ),
                                          ),
                                        ),
//                                        Container(
//                                            child: _image == null
//                                                ? Container(
//                                              width: 0, height: 0,)
//                                                : Row(
//                                                children: <Widget>[
//                                                  GestureDetector(
//                                                    child: isUploadVideo ==
//                                                        false
//                                                        ? Image.file(_image,
//                                                      width: (queryData.size
//                                                          .width / 375) * 70,
//                                                      height: (queryData.size
//                                                          .width / 375) * 50,)
//                                                        : Image.asset(
//                                                      thumbImage,
//                                                      width: (queryData.size
//                                                          .width / 375) * 70,
//                                                      height: (queryData.size
//                                                          .width / 375) *
//                                                          50,),
//                                                    onTap: () {
//                                                      removeImageOrVideo(
//                                                          context);
//                                                    },
//                                                  )
//                                                ]
//                                            )
//                                        ),
                                      ],
                                    )
                                )
                            ),
                          ],
                        ),
                      ),
                  ],
                )
            ),
          ),
        )
    );
  }
}