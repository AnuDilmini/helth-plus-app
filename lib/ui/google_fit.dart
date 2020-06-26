import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/health.dart';
import 'package:health_plus/screen_shape/product_clip.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'package:ok_image/ok_image.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'dashboard.dart';

class GoogleFit extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<GoogleFit> {
  var _healthKitOutput;
  var _healthDataList = List<HealthDataPoint>();
  bool _isAuthorized = false;
  MediaQueryData queryData;
  var data = [ ClicksStepsCount('2016', 12, Colors.red)];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    DateTime startDate = DateTime.utc(2001, 01, 01);
//    final now = DateTime.now();
//    DateTime startDate = new DateTime(now.year, now.month, now.day-1);
//    final lastMidnight = new DateTime(now.year, now.month, now.day);
    DateTime endDate = DateTime.now();

    Future.delayed(Duration(seconds: 2), () async {
      _isAuthorized = await Health.requestAuthorization();

      if (_isAuthorized) {
        print('Authorized');

        bool weightAvailable =
        Health.isDataTypeAvailable(HealthDataType.STEPS);
        print("is STEPS data type available?: $weightAvailable");

        /// Specify the wished data types
        List<HealthDataType> types = [
          HealthDataType.STEPS,
        ];

        for (HealthDataType type in types) {
          /// Calls to 'Health.getHealthDataFromType'
          /// must be wrapped in a try catch block.b
          try {
            if(_healthDataList.isNotEmpty){
              _healthDataList.clear();
            }

            if(data.isNotEmpty){
              data.clear();
            }

            List<HealthDataPoint> healthData =
            await Health.getHealthDataFromType(startDate, endDate, type);
            _healthDataList.addAll(healthData);

          } catch (exception) {
            print(exception.toString());
          }
        }

        /// Print the results
        int count;
        int y =0;
        print("chart");
        for(int x = _healthDataList.length- 20; x < _healthDataList.length; x++ ){
          print(" x $x-1");
          y++;

          count = _healthDataList[x].value.round();
          print("count $count");
          print("colors ${listColor[(x)%10]}");
          print("${DateTime.fromMillisecondsSinceEpoch(_healthDataList[x].dateFrom).day}");
          data.add(ClicksStepsCount('$y',count, listColor[(x)%10] ));
        }

        /// Update the UI to display the results
        setState(() {});
      } else {
        print('Not authorized');
      }
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }


//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Plugin example app'),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.sync),
//              onPressed: () {
//                initPlatformState();
//              },
//            )
//          ],
//        ),
//        body:
//        _healthDataList.isEmpty
//            ? Text('Step Count')
//            : ListView.builder(
//            itemCount: _healthDataList.length,
//            itemBuilder: (_, index) => ListTile(
//              title: Text(
//                  "${_healthDataList[index].dataType.toString()}: ${_healthDataList[index].value.toString()}"),
//              trailing: Text('${_healthDataList[index].unit}'),
//              subtitle: Text(
//                  '${DateTime.fromMillisecondsSinceEpoch(_healthDataList[index].dateFrom)} - ${DateTime.fromMillisecondsSinceEpoch(_healthDataList[index].dateTo)}'),
//            )),
//      ),
//    );
//  }

  var listColor = [
    Colors.amber,
    Colors.pink[400],
    Colors.blue[400],
    Colors.green,
    Colors.brown,
    Colors.blueGrey,
    Colors.deepOrangeAccent,
    Colors.purple,
    Colors.indigo,
    Colors.black54,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {

    var series = [
      charts.Series(
        domainFn: (ClicksStepsCount clickData, _) => clickData.year,
        measureFn: (ClicksStepsCount clickData, _) => clickData.clicks,
        colorFn: (ClicksStepsCount clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width / 414;
    Constant.screenHeight = queryData.size.height/812;
//    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
        body:SingleChildScrollView(
          child: Stack(
          children: <Widget>[
            Container(
              width: Constant.screenWidth * 414,
              height: Constant.screenHeight * 812,
              color:  Palette.orangeLight,
              child: Column(
                  children: <Widget>[
                    Container(
                      width: Constant.screenWidth * 414,
                      height: Constant.screenHeight * 350,
                      padding: EdgeInsets.only(top: Constant.screenHeight * 150, bottom: Constant.screenHeight * 50),
                      color: Palette.orangeLight,
                      child:_healthDataList.isEmpty
                          ? Text('Counting...',
                            textAlign: TextAlign.center,
                            style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white,
                            fontSize: 22.0),
                      ):ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                        return Container(
                          width: (Constant.screenWidth) * 200,
                          height: (Constant.screenHeight) * 150,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .circular(8.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius
                                    .circular(8.0),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('${_healthDataList[_healthDataList.length-1-index].dataType.toString()} \n  ',style: new TextStyle(fontWeight: FontWeight.bold,color: Palette.orangeLight)),
                                    Text('${_healthDataList[_healthDataList.length-1-index].value.toString()}  ${_healthDataList[_healthDataList.length-1-index].unit}\n  ', style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 18.0)),
                                    Text('${DateTime.fromMillisecondsSinceEpoch(_healthDataList[_healthDataList.length-1-index].dateFrom)} - ${DateTime.fromMillisecondsSinceEpoch(_healthDataList[_healthDataList.length-1-index].dateTo)}', style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
                                    textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                              elevation: 8,
                            ),
                            );
                          }
                      ),
                    ),
                    Container(
                        width: Constant.screenWidth * 414,
                        height: Constant.screenHeight* 462,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(8.0),
                            topRight: const Radius.circular(8.0),
                          ),
                        ),
                      child: _healthDataList.isEmpty
                          ? Text('Loading...',
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Palette.orangeLight,
                            fontSize: 22.0),
                      ):chartWidget,
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
                },
              ),
            ),
            Positioned(
              left: Constant.screenWidth* 350,
              top: Constant.screenHeight *30,
              child: IconButton(
                icon: Icon(
                  Icons.sync,
                  color: Colors.white,
                ),
                onPressed: () {
                  initPlatformState();
                },
              ),
            ),
            Positioned(
                left: Constant.screenWidth*150,
                top: Constant.screenHeight *50,
                child:  Center(
                  child: Text(
                    "Steps Count",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'HKGrotesk-SemiBold',
                        color: Colors.white,
                        fontSize: 20),
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                ),
            ),
          ],
        )
        ),
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
                child:Text("It's recommended that you eat at least 5 portions of a variety of fruit and veg every day. They can be fresh, frozen, canned, dried or juiced.\nGetting your 5 A Day is easier than it sounds. Why not chop a banana over your breakfast cereal, or swap your usual mid-morning snack for a piece of fresh fruit?\nA portion of fresh, canned or frozen fruit and vegetables is 80g. A portion of dried fruit (which should be kept to mealtimes) is 30g.\nA 150ml glass of fruit juice, vegetable juice or smoothie also counts as 1 portion, but limit the amount you have to no more than 1 glass a day as these drinks are sugary and can damage your teeth.",
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

//  _healthData(){
//
//    final now = DateTime.now();
//    int length = _healthDataList.length;
//    DateTime startDate = new DateTime(now.year, now.month, now.day-7);
//    DateTime tDate=  DateTime.fromMillisecondsSinceEpoch(_healthDataList[length-1].dateFrom);
//    print("fromMillisecondsSinceEpoch $tDate");
//    print("startDate $startDate");
//    print("startDate*  ${startDate.millisecondsSinceEpoch}");
//
//    for(int i =_healthDataList.length; i >0; i--){
//      print("anu");
//      print("check ${DateTime.fromMillisecondsSinceEpoch(_healthDataList[i-1].dateFrom)}");
//      print("check ${DateTime.fromMillisecondsSinceEpoch(_healthDataList[i-1].dateFrom).millisecondsSinceEpoch}");
//      if( DateTime.fromMillisecondsSinceEpoch(_healthDataList[i-1].dateFrom).millisecondsSinceEpoch >= startDate.millisecondsSinceEpoch){
//        _healthDataListNew.add(_healthDataList[i-1]);
//        print("date *** ");
//        print(DateTime.fromMillisecondsSinceEpoch(_healthDataList[i].dateFrom));
//      }
//    }
//
//
//
//    if(_healthDataList.isEmpty){
//      print("steps count empty ${_healthDataList.length} ");
//    }else{
//      print("steps count  ${_healthDataList.length} ");
//    }
//
////    if(!_healthDataList.isEmpty){
//
//
////    }
//
//  }

}

class ClicksStepsCount {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksStepsCount(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
