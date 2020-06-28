
import 'dart:io';

import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/drawer/bottom_navigation.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'login_screen.dart';

class Check extends StatefulWidget {
  Check({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Check createState() => _Check();
}

class _Check extends State<Check> with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String first_name = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSignUpValues();

  }

  getSignUpValues () async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    first_name = prefs.getString('first_name') ;

    print("my first_name $first_name");
    Future.delayed(const Duration(milliseconds: 100), () async {
      if (first_name != null) {

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNav(index: 0)), (route) => false);

      } else {

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);

      }
    });
  }


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              const Color(0xFFFC663C),
              const Color(0xFFFF3F1A),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
          ),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                height: height,
                child:Align(
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: GestureDetector(
                child: Container(
                    height: height,
                    child:Stack(
                      children: <Widget>[
                        Container(
                          child: SpinKitRipple(color: Colors.white, size: height/2.5,),
                        ),
                        Center(
                          child: Container(
                            height: height/9,
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                    color: Color(0xFF3F2063),
                                    blurRadius: 5.0,
                                    spreadRadius: 0.01
                                ),],
                                gradient: new LinearGradient(
                                  colors: [
                                    const Color(0xFFFC663C),
                                    const Color(0xFFFF3F1A),
                                  ],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(0.5, 1.0),
                                ),
                                color: Palette.orangeColor,
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircularPercentIndicator(
                                radius: height/12,
                                animation: true,
                                lineWidth: 1.0,
                                percent: 1,
                                backgroundColor: Colors.transparent,
                                progressColor: Colors.white,
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child:  Text(
                  "This will only take a few seconds",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Barlow-Medium'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFileHome async {
    final path = await _localPath;
    // print("_localFileHome");
    return File('$path/json_home.json');
  }

  Future<File> writeCounter() async {
    DefaultAssetBundle.of(context).loadString('assets/data.json');
    File file;
    file = await _localFileHome;
print("${DefaultAssetBundle.of(context).loadString('assets/data.json')}");
    print(" json==> $file");

    return file.writeAsString('${DefaultAssetBundle.of(context).loadString('assets/data.json')}');
  }

  showSnackbar(BuildContext context, String msg){
    final snackBar = SnackBar(content: Text(msg),backgroundColor: Palette.orangeColor,);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}