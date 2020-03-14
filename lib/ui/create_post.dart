import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/ui/dashboard.dart';
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
  TextEditingController postTextController = TextEditingController();

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
        body: SingleChildScrollView(
          child:     Stack(
            children: <Widget>[
              Container(
                height: (Constant.screenHeight* 812) * 0.9,
                width: Constant.screenWidth * 414,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF8333),
                        Color(0xFFFC663C),
                        Color(0xFFFF3F1A)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child:Column(
                  children: <Widget>[
                    Container(
                      height: Constant.screenHeight *120,
                      width: Constant.screenWidth * 414,
                    ),
                    Container(
                      width: Constant.screenWidth * 414,
                      height: (Constant.screenHeight* 812) * 0.8 - (Constant.screenHeight * 120),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(15.0),
                              topRight: const Radius.circular(15.0))),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: (Constant.screenHeight ) * 140,
                left: (Constant.screenWidth ) * 20,
                child: Container(
                    width: (Constant.screenHeight ) * 60,
                    height: (Constant.screenHeight ) * 60,
                    decoration: new BoxDecoration(
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
                  top: (Constant.screenHeight ) * 140,
                  left: (Constant.screenWidth ) * 100,
                  child:Center(
                      child: Text("Anushika Dilmini",
                        style: TextStyle(
                            color: Palette.black,
                            fontFamily: "HKGrotesk-Regular",
                            fontSize: 17.0
                        ),)
                  )
              ),
              Positioned(
                  top: (Constant.screenHeight ) * 170,
                  left: (Constant.screenWidth ) * 95,
                  width: (Constant.screenWidth ) * 170,
                  height: (Constant.screenHeight ) * 35,
                  child:Container(
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(color: Colors.grey[300])
                          ),
                          prefixIcon: Icon(Icons.supervisor_account,
                              size: 18.0),
                          suffixIcon:  Icon(Icons.arrow_drop_down,
                            size: 18.0,),
                          labelText: "Public",
                          labelStyle: TextStyle(color: Palette.darkGrey,
                              fontSize: 10.0,
                              fontFamily: "HKGrotesk-Regular"),
                        ),)
                  )
              ),
              Positioned(
                  top: (Constant.screenHeight ) * 60,
                  width: Constant.screenWidth * 414,
                  child:Center(
                      child: Text("Update Status",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "HKGrotesk-Regular",
                            fontSize: 20.0
                        ),)
                  )
              ),
              Positioned(
                top: (Constant.screenHeight ) * 40,
                left: Constant.screenWidth * 20,
                width: Constant.screenWidth * 50,
                child: GestureDetector(
                    child: Center(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white,),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigation(index: 0)));
                          },
                        )
                    )
                ),
              ),
              Positioned(
                top: (Constant.screenHeight ) * 55,
                left: Constant.screenWidth * 350,
                width: Constant.screenWidth * 50,
                child: Center(
                    child: Icon(Icons.check,
                      color: Colors.white,)
                ),
              ),
              Positioned(
                top: (Constant.screenHeight ) * 240,
                left: Constant.screenWidth * 20,
                right: Constant.screenWidth * 20,
                height: (Constant.screenHeight ) * 600,
                child: TextField(
                  controller: postTextController,
                  autocorrect: true,
                  autofocus: true,
                  maxLines: 8,
                  decoration: InputDecoration
                      .collapsed(
                    hintText: 'What’s on your mind ?',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'HKGrotesk-Regular',
                      color: Palette.grayColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: (Constant.screenHeight ) * 750,
                  width: Constant.screenWidth * 414,
                  child: Container(
                    height: Constant.screenHeight * 1,
                    color: Palette.grayColor,
                  )
              ),
              Positioned(
                  top: (Constant.screenHeight ) * 130,
                  left: (Constant.screenWidth ) * 310,
                  child: Image.asset("assets/images/photo_icon.png",
                    height: (Constant.screenHeight ) * 60,
                    width: (Constant.screenHeight ) * 60,
                  )
              ),
              Positioned(
                  top: (Constant.screenHeight ) * 190,
                  left: (Constant.screenWidth ) * 310,
                  child: Text("Photo/Video",
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.blueGrey
                    ),)
              ),
            ],
          ),
        )

      ),
    );
  }

}