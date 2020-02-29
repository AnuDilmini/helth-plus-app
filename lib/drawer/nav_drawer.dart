
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  String version = "";
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width;
    Constant.screenHeight = queryData.size.height;
    return Drawer(
        child:Stack(
          children: <Widget>[
            Container(
              width: Constant.screenWidth,
              height: Constant.screenHeight,
              color:Palette.eggplantPurple80,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: (Constant.screenHeight/896) * 221, left: (Constant.screenWidth/414) * 86),
                    height:(Constant.screenHeight/896) *675,
                    width: Constant.screenWidth,
                    color: Palette.orangeColor,
                  ),
                ],
              ),

//


//                  Padding(
//                      padding: EdgeInsets.only(top: (Constant.screenHeight/896) * 22, left:(Constant.screenWidth/414) *86),
//                      child:Container(
//                          width:(Constant.screenWidth/414) * 327,
//                          height: (Constant.screenHeight/896) * 681,
//                          color: Palette.darkishPurple,
//                          child: Column(
//                            children: <Widget>[
//                              Padding(
//                                  padding: EdgeInsets.all(0.0),
//                                  child: Container(
//                                    height: (Constant.screenHeight /896) *6,
//                                    width: Constant.screenWidth,
//                                    decoration: new BoxDecoration(
//                                      gradient: new LinearGradient(
//                                        colors: [
//                                          Palette.lightGreen,
//                                          Palette.lightBlue
//                                        ],
//                                      ),
//                                      // border color
//                                    ),
//                                  )
//                              ),
//                              Padding(
//                                  padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 35, left:(Constant.screenWidth/414) * 70),
//                                  child: Container(
//                                      width: Constant.screenWidth,
//                                      child: Text("Loyalty Programme",
//                                        textAlign: TextAlign.left,
//                                        style: TextStyle(
//                                            fontFamily: "Montserrat-Light",
//                                            fontSize: 17.0,
//                                            color: Colors.white
//                                        ),)
//                                  )
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 30, left:(Constant.screenWidth/414) * 70),
//                                child: Container(
//                                    width: Constant.screenWidth,
//                                    child: Text("Deals and Offers",
//                                      style: TextStyle(
//                                          fontFamily: "Montserrat-Light",
//                                          fontSize: 17.0,
//                                          color: Colors.white
//                                      ),)
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 30, left:(Constant.screenWidth/414) * 70),
//                                child: Container(
//                                    width: Constant.screenWidth,
//                                    child: Text("Shops",
//                                      style: TextStyle(
//                                          fontFamily: "Montserrat-Light",
//                                          fontSize: 17.0,
//                                          color: Colors.white
//                                      ),)
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 30, left:(Constant.screenWidth/414) * 70),
//                                child: Container(
//                                    width: Constant.screenWidth,
//                                    child: Text("Cinema",
//                                      style: TextStyle(
//                                          fontFamily: "Montserrat-Light",
//                                          fontSize: 17.0,
//                                          color: Colors.white
//                                      ),)
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 30, left:(Constant.screenWidth/414) * 70),
//                                child: Container(
//                                  width: Constant.screenWidth,
//                                  child: Text("Dining and Entertainment",
//                                    style: TextStyle(
//                                        fontFamily: "Montserrat-Light",
//                                        fontSize: 17.0,
//                                        color: Colors.white
//                                    ),),
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 30, left:(Constant.screenWidth/414) * 70),
//                                child: Container(
//                                  width: Constant.screenWidth,
//                                  child: Text("Restaurants",
//                                    style: TextStyle(
//                                        fontFamily: "Montserrat-Light",
//                                        fontSize: 17.0,
//                                        color: Colors.white
//                                    ),),
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 30, left:(Constant.screenWidth/414) * 70),
//                                child: Container(
//                                    width: Constant.screenWidth,
//                                    child:  Text("Parking",
//                                      style: TextStyle(
//                                          fontFamily: "Montserrat-Light",
//                                          fontSize: 17.0,
//                                          color: Colors.white
//                                      ),)
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 30, left:(Constant.screenWidth/414) * 70),
//                                child: Container(
//                                    width: Constant.screenWidth,
//                                    child:  Text("Settings",
//                                      style: TextStyle(
//                                          fontFamily: "Montserrat-Light",
//                                          fontSize: 17.0,
//                                          color: Colors.white
//                                      ),)
//                                ),
//                              ),
//                              Padding(
//                                  padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 20),
//                                  child: GestureDetector(
//                                    child: Container(
//                                        height: (Constant.screenHeight/896) * 84,
//                                        color: Palette.plum,
//                                        child: Row(
//                                          children: <Widget>[
//                                            Expanded(
//                                              flex: 2,
//                                              child: Icon(Icons.exit_to_app,
//                                                color: Colors.white,
////                                       height: (Constant.screenHeight/896)  * 40,
////                                       width: Constant.screenWidth/15,
////                                       alignment:Alignment.centerRight ,
////                                       fit: BoxFit.contain,
//                                              ),
//                                            ),
//                                            Expanded(
//                                                flex: 2,
//                                                child: Text("Log Out",
//                                                  style: TextStyle(
//                                                      fontFamily: "Montserrat-Light",
//                                                      fontSize: 17.0,
//                                                      color: Colors.white
//                                                  ),)
//                                            )
//                                          ],
//                                        )
//                                    ),
//                                  )
//                              ),
//                              Padding(
//                                padding: EdgeInsets.only(top: (Constant.screenHeight/681) * 15, left:(Constant.screenWidth/414) * 70),
//                                child: Container(
//                                    width: Constant.screenWidth,
//                                    child:  Text("V $version",
//                                      style: TextStyle(
//                                          fontFamily: "Montserrat-Light",
//                                          fontSize: 17.0,
//                                          color: Colors.black
//                                      ),)
//                                ),
//                              ),
//                            ],
//                          )
//                      )
//                  )

            ),
            Positioned(
                top: (Constant.screenHeight /896) * 72,
                left: (Constant.screenWidth/414) * 143,
                right: (Constant.screenWidth/414) * 225,
                height: (Constant.screenHeight /896) * 54,
                child:Container(
                    child:new Container(
                        child: Image.asset("assets/images/profile.png",
                        )  )
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 139,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: Text("Hello, John Doe",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat-Regular",
                      fontSize: 17.0
                  ),)
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 170,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: Text("Go to Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat-Light",
                      fontSize: 13.0
                  ),)
            ),
            Positioned(
              top: (Constant.screenHeight /896) * 215,
              left: (Constant.screenWidth/414) * 86,
              height: (Constant.screenHeight /896) * 6,
              width: Constant.screenWidth,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Palette.sickGreen, Palette.azure],
                  ),
                ),
              ),
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 255,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Loyalty Programme",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Light",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    print("Anu");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 310,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Deals and Offers",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Light",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    print("Deals and Offers");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 365,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Shops ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Light",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    print("Shops");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 417,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Cinema ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Light",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    print("Cinema");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 469,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Dining and Entertainment",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Light",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    print("Dining and Entertainment");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 520,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Restaurants",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Light",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    print("Restaurants");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 572,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child:Text("Parking",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Light",
                        fontSize: 17.0
                    ),) ,
                  onTap: (){
                    print("Parking");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 623,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Text("Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat-Light",
                        fontSize: 17.0
                    ),),
                  onTap: (){
                    print("Settings");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 761,
                left: (Constant.screenWidth/414) * 86,
                width: Constant.screenWidth,
                child: GestureDetector(
                  child: Container(
                    height: (Constant.screenHeight /896) * 84,
                    color: Palette.plum,
                  ),
                  onTap: (){
                    print("logout");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 792,
                left: (Constant.screenWidth/414) * 146,
                right: (Constant.screenWidth/414) * 245,
                child: GestureDetector(
                  child: Icon(Icons.exit_to_app,
                    color: Colors.white,),
                  onTap: (){
                    print("logout icon");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 792,
                left: (Constant.screenWidth/414) * 187,
                right: (Constant.screenWidth/414) * 125,
                child: GestureDetector(
                  child: Text("Log Out",
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: "Montserrat-Light",
                        color: Colors.white

                    ),
                  ),
                  onTap: (){
                    print("Log Out message");
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight /896) * 859,
                left: (Constant.screenWidth/414) * 143,
                width: Constant.screenWidth,
                child:Text("V ${version}",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Montserrat-Light",
                      color: Palette.eggplant
                  ),
                )
            ),
          ],
        )
    );
  }


  @override
  void initState() {
  }

}
