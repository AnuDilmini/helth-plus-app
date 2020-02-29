import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

import 'dashboard.dart';

class ProfileEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileEditLayout();
  }
}

class ProfileEditLayout extends State<ProfileEdit> {

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
        body: Stack(
          children: <Widget>[
            Container(
              height: Constant.screenHeight* 812,
              width: Constant.screenWidth * 414,
            ),
            Positioned(
                top: (Constant.screenHeight ) * 60,
                left: Constant.screenWidth * 21,
                width: Constant.screenWidth * 50,
                child:GestureDetector(
                  child: Center(
                      child: Icon(Icons.arrow_back,)
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 110,
                width: Constant.screenWidth *414,
                child:Container(
                  height: (Constant.screenHeight ) * 1,
                  color: Palette.darkGrey,
                )
            ),
            Positioned(
              top: (Constant.screenHeight ) * 140,
              left: (Constant.screenWidth ) * 20,
              child: Container(
                  width: (Constant.screenHeight ) * 100,
                  height: (Constant.screenHeight ) * 100,
                  decoration: new BoxDecoration(
                      color: Palette.orangeColor,
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                            "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                          )
                      )
                  )),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 170,
              left: (Constant.screenWidth ) * 150,
              child: Container(
                  width: (Constant.screenHeight ) * 200,
                  height: (Constant.screenHeight ) * 60,
                  child: Text("Anushika Dilmini",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Montserrat-Bold",
                    color: Palette.orangeColor
                  ),),
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 240,
              left: (Constant.screenWidth ) * 65,
              child: Container(
                width: (Constant.screenHeight ) * 4,
                height: (Constant.screenHeight ) * 100,
                color: Palette.orangeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showAlert(BuildContext context, String text) {
    var alert = new AlertDialog(
      content: Container(
        child: Row(
          children: <Widget>[Text(text)],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          return alert;
        });
  }

}