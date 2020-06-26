import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';
import 'package:health_plus/utils/network_helper.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class ProfileEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileEditLayout();
  }
}

class ProfileEditLayout extends State<ProfileEdit> {

  MediaQueryData queryData;

  TextEditingController editCountry =  TextEditingController();
  TextEditingController editMobile =  TextEditingController();
  TextEditingController editFirstName =  TextEditingController();
  TextEditingController editLastName =  TextEditingController();
  TextEditingController editCompany =  TextEditingController();
  TextEditingController editDateOfBirth =  TextEditingController();
  TextEditingController editNIC =  TextEditingController();
  TextEditingController editGender =  TextEditingController();

  bool isFirstName = false, isLastName = false, isCompany = false, isMobile = false, isDateOfBirth = false, isNIC= false, isGender = false;


  @override
  void initState() {
    editCountry.text = "Sri Lanka";
  }

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
          child:Stack(
          children: <Widget>[
            Container(
              height: (Constant.screenHeight* 812) * 1.2 ,
              width: (Constant.screenWidth * 414) ,
            ),
            Positioned(
                top: Constant.screenHeight  *40,
                left: Constant.screenWidth * 21,
                width: Constant.screenWidth * 50,
                height: Constant.screenHeight  * 50,
                child:GestureDetector(
                  child: Center(
                      child: Icon(Icons.arrow_back,)
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigation(index: 0)));
                  },
                )
            ),
            Positioned(
                top: (Constant.screenHeight ) * 100,
                width: Constant.screenWidth *414,
                child:Container(
                  height: (Constant.screenHeight ) * 1,
                  color: Palette.darkGrey,
                )
            ),
            Positioned(
              top: (Constant.screenHeight ) * 120,
              left: (Constant.screenWidth ) * 20,
              child: Container(
                  width: (Constant.screenHeight ) * 90,
                  height: (Constant.screenHeight ) * 90,
                  decoration: new BoxDecoration(
                      color: Palette.orangeLight,
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
              top: (Constant.screenHeight ) * 150,
              left: (Constant.screenWidth ) * 130,
              child: Container(
                  width: (Constant.screenHeight ) * 200,
                  height: (Constant.screenHeight ) * 60,
                  child: Text("Rosiru Tharumal",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "HKGrotesk-Bold",
                    color: Palette.orangeLight
                  ),),
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 210,
              left: (Constant.screenWidth ) * 57,
              child: Container(
                width: (Constant.screenHeight ) * 3,
                height: (Constant.screenHeight ) * 100,
                color: Palette.orangeLight,
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 255,
              left: (Constant.screenWidth ) * 57,
              child: Container(
                width: (Constant.screenWidth ) * 40,
                height: (Constant.screenHeight ) * 2,
                color: Palette.orangeLight,
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 252,
              left: (Constant.screenWidth ) * 95,
              child: Container(
                  width: (Constant.screenHeight ) * 10,
                  height: (Constant.screenHeight ) * 10,
                  decoration: new BoxDecoration(
                      color: Palette.orangeLight,
                      shape: BoxShape.circle,
                  )),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 245,
              left: (Constant.screenWidth ) * 118,
              child: Container(
                width: (Constant.screenHeight ) * 200,
                height: (Constant.screenHeight ) * 60,
                child: Text("PROFILE",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "HKGrotesk-Bold",
                      color: Palette.greyishBrown
                  ),),
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 310,
              left: (Constant.screenWidth ) * 40,
              child: Container(
                  width: (Constant.screenHeight ) * 40,
                  height: (Constant.screenHeight ) * 40,
                  decoration: new BoxDecoration(
                      color: Palette.grayColor,
                      shape: BoxShape.circle,
                  )),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 300,
              left: (Constant.screenWidth ) * 118,
              right: (Constant.screenWidth ) * 10,
              height: (Constant.screenHeight ) * 70,
              child:
              isFirstName?
              Container(
                child:TextFormField(
                autofocus:false,
//                cursorColor: Colors.black,
                decoration: InputDecoration(
//                  suffixIcon: new IconButton(
//                    icon: new Icon(Icons.check,
//                      size: 18.0,
//                      color: Colors.green),
//                      onPressed: () {
//                        setState(() {
//                          isFirstName = false;
//                        });
//                      },
//                  ),
                  labelText: "First Name",
                  labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color:  Color(0xFFFF8111),
                          width: 1.0)
                  ),
//                  filled: true,
//                  fillColor: Colors.white,
//                  hintText: "Name",
                ),
                controller: editFirstName,
               )
              ):
              Container(
               child:TextFormField(
                 autofocus:false,
                controller: editFirstName,
                enabled: true,
                decoration: new InputDecoration(
                  suffixIcon: new IconButton(
                    icon: new Icon(Icons.edit,
                    size: 18.0,
                    color: Palette.grayColor,),
                    onPressed: () {
                      setState(() {
                        isFirstName = true;
                      });
                    },
                  ),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(
                          color: Palette.grayColor
                      )
                  ),
                  labelText: "First Name",
                  labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                  hintText: "First Name",
                  hintStyle: TextStyle(fontSize: 12, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Medium' ),
                ),
              )
            ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 350,
              left: (Constant.screenWidth ) * 57,
              child: Container(
                width: (Constant.screenHeight ) * 3,
                height: (Constant.screenHeight ) * 50,
                color: Palette.grayColor,
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 390,
              left: (Constant.screenWidth ) * 40,
              child: Container(
                  width: (Constant.screenHeight ) * 40,
                  height: (Constant.screenHeight ) * 40,
                  decoration: new BoxDecoration(
                    color: Palette.grayColor,
                    shape: BoxShape.circle,
                  )),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 380,
              left: (Constant.screenWidth ) * 118,
              right: (Constant.screenWidth ) * 10,
              height: (Constant.screenHeight ) * 70,
              child:
              isLastName?
              Container(
                  child:TextFormField(
                    autofocus:false,
//                cursorColor: Colors.black,
                    decoration: InputDecoration(
//                      suffixIcon: new IconButton(
//                        icon: new Icon(Icons.check,
//                            size: 18.0,
//                            color: Colors.green),
//                        onPressed: () {
//                          setState(() {
//                            isLastName = false;
//                          });
//                        },
//                      ),
                      labelText: "Last Name",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color:  Color(0xFFFF8111),
                              width: 1.0)
                      ),
//                      filled: true,
//                      fillColor: Colors.white,
                      hintText: "Last",
                    ),
                    controller: editLastName,
                  )
              ):
              Container(
                  child:TextFormField(
                    autofocus:false,
                    controller: editLastName,
                    enabled: true,
                    decoration: new InputDecoration(
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.edit,
                          size: 18.0,
                          color: Palette.grayColor,),
                        onPressed: () {
                          setState(() {
                            isLastName = true;
                          });
                        },
                      ),
                      border: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Palette.grayColor
                          )
                      ),
                      labelText: "Last Name",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      hintText: "Last Name",
                      hintStyle: TextStyle(fontSize: 12, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Medium' ),
                    ),
                  )
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 430,
              left: (Constant.screenWidth ) * 57,
              child: Container(
                width: (Constant.screenHeight ) * 3,
                height: (Constant.screenHeight ) * 50,
                color: Palette.grayColor,
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 470,
              left: (Constant.screenWidth ) * 40,
              child: Container(
                  width: (Constant.screenHeight ) * 40,
                  height: (Constant.screenHeight ) * 40,
                  decoration: new BoxDecoration(
                    color: Palette.grayColor,
                    shape: BoxShape.circle,
                  )),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 460,
              left: (Constant.screenWidth ) * 118,
              right: (Constant.screenWidth ) * 10,
              height: (Constant.screenHeight ) * 70,
              child:
              isMobile?
              Container(
                  child:TextFormField(
                    autofocus:false,
//                cursorColor: Colors.black,
                    decoration: InputDecoration(
//                      suffixIcon: new IconButton(
//                        icon: new Icon(Icons.check,
//                            size: 18.0,
//                            color: Colors.green),
//                        onPressed: () {
//                          setState(() {
//                            isMobile = false;
//                          });
//                        },
//                      ),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color:  Color(0xFFFF8111),
                              width: 1.0)
                      ),
//                      filled: true,
//                      fillColor: Colors.white,
                      hintText: "Phone Number",
                    ),
                    controller: editMobile,
                  )
              ):
              Container(
                  child:TextFormField(
                    autofocus:false,
                    controller: editMobile,
                    enabled: true,
                    decoration: new InputDecoration(
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.edit,
                          size: 18.0,
                          color: Palette.grayColor,),
                        onPressed: () {
                          setState(() {
                            isMobile = true;
                          });
                        },
                      ),
                      border: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Palette.grayColor
                          )
                      ),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      hintText: "Phone Number",
                      hintStyle: TextStyle(fontSize: 12, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Medium' ),
                    ),
                  )
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 510,
              left: (Constant.screenWidth ) * 57,
              child: Container(
                width: (Constant.screenHeight ) * 3,
                height: (Constant.screenHeight ) * 50,
                color: Palette.grayColor,
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 550,
              left: (Constant.screenWidth ) * 40,
              child: Container(
                  width: (Constant.screenHeight ) * 40,
                  height: (Constant.screenHeight ) * 40,
                  decoration: new BoxDecoration(
                    color: Palette.grayColor,
                    shape: BoxShape.circle,
                  )),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 540,
              left: (Constant.screenWidth ) * 118,
              right: (Constant.screenWidth ) * 10,
              height: (Constant.screenHeight ) * 70,
              child:
              isDateOfBirth?
              Container(
                  child:TextFormField(
                    autofocus:false,
//                cursorColor: Colors.black,
                    decoration: InputDecoration(
//                      suffixIcon: new IconButton(
//                        icon: new Icon(Icons.check,
//                            size: 18.0,
//                            color: Colors.green),
//                        onPressed: () {
//                          setState(() {
//                            isDateOfBirth = false;
//                          });
//                        },
//                      ),
                      labelText: "Date of Birth",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color:  Color(0xFFFF8111),
                              width: 1.0)
                      ),
//                      filled: true,
//                      fillColor: Colors.white,
                      hintText: "Date of Birth",
                    ),
                    controller: editDateOfBirth,
                  )
              ):
              Container(
                  child:TextFormField(
                    autofocus:false,
                    controller: editDateOfBirth,
                    enabled: true,
                    decoration: new InputDecoration(
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.edit,
                          size: 18.0,
                          color: Palette.grayColor,),
                        onPressed: () {
                          setState(() {
                            isDateOfBirth = true;
                          });
                        },
                      ),
                      border: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Palette.grayColor
                          )
                      ),
                      labelText: "Date of Birth",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      hintText: "Date of Birth",
                      hintStyle: TextStyle(fontSize: 12, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Medium' ),
                    ),
                  )
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 590,
              left: (Constant.screenWidth ) * 57,
              child: Container(
                width: (Constant.screenHeight ) * 3,
                height: (Constant.screenHeight ) * 50,
                color: Palette.grayColor,
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 630,
              left: (Constant.screenWidth ) * 40,
              child: Container(
                  width: (Constant.screenHeight ) * 40,
                  height: (Constant.screenHeight ) * 40,
                  decoration: new BoxDecoration(
                    color: Palette.grayColor,
                    shape: BoxShape.circle,
                  )),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 620,
              left: (Constant.screenWidth ) * 118,
              right: (Constant.screenWidth ) * 10,
              height: (Constant.screenHeight ) * 70,
              child:
              isGender?
              Container(
                  child:TextFormField(
                    autofocus:false,
//                cursorColor: Colors.black,
                    decoration: InputDecoration(
//                      suffixIcon: new IconButton(
//                        icon: new Icon(Icons.check,
//                            size: 18.0,
//                            color: Colors.green),
//                        onPressed: () {
//                          setState(() {
//                            isGender = false;
//                          });
//                        },
//                      ),
                      labelText: "Gender",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color:  Color(0xFFFF8111),
                              width: 1.0)
                      ),
//                      filled: true,
//                      fillColor: Colors.white,
                      hintText: "Gender",
                    ),
                    controller: editGender,
                  )
              ):
              Container(
                  child:TextFormField(
                    autofocus:false,
                    controller: editGender,
                    enabled: true,
                    decoration: new InputDecoration(
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.edit,
                          size: 18.0,
                          color: Palette.grayColor,),
                        onPressed: () {
                          setState(() {
                            isGender = true;
                          });
                        },
                      ),
                      border: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Palette.grayColor
                          )
                      ),
                      labelText: "Gender",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      hintText: "Gender",
                      hintStyle: TextStyle(fontSize: 12, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Medium' ),
                    ),
                  )
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 670,
              left: (Constant.screenWidth ) * 57,
              child: Container(
                width: (Constant.screenHeight ) * 3,
                height: (Constant.screenHeight ) * 50,
                color: Palette.grayColor,
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 710,
              left: (Constant.screenWidth ) * 40,
              child: Container(
                  width: (Constant.screenHeight ) * 40,
                  height: (Constant.screenHeight ) * 40,
                  decoration: new BoxDecoration(
                    color: Palette.grayColor,
                    shape: BoxShape.circle,
                  )),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 700,
              left: (Constant.screenWidth ) * 118,
              right: (Constant.screenWidth ) * 10,
              height: (Constant.screenHeight ) * 70,
              child:
              isNIC?
              Container(
                  child:TextFormField(
                    autofocus:false,
//                cursorColor: Colors.black,
                    decoration: InputDecoration(
//                      suffixIcon: new IconButton(
//                        icon: new Icon(Icons.check,
//                            size: 18.0,
//                            color: Colors.green),
//                        onPressed: () {
////                          setState(() {
////                            isNIC = false;
////                          });
//                        },
//                      ),
//                    labelText: "NIC",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color:  Color(0xFFFF8111),
                              width: 1.0)
                      ),
//                      enabledBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(8)),
//                          borderSide: BorderSide(color:  Colors.black,
//                              width: 1.0)
//                      ),
//                      filled: true,
//                      fillColor: Colors.white,
                      hintText: "NIC",
                    ),
                    controller: editNIC,
                  )
              ):
              Container(
                  child:TextFormField(
                    autofocus:false,
                    controller: editNIC,
                    enabled: true,
                    decoration: new InputDecoration(
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.edit,
                          size: 18.0,
                          color: Palette.grayColor,),
                        onPressed: () {
                          setState(() {
                            isNIC = true;
                          });
                        },
                      ),
                      border: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Palette.grayColor
                          )
                      ),
                      labelText: "NIC",
                      labelStyle: TextStyle(fontSize: 12, color: Palette.orangeLight,  fontFamily: 'HKGrotesk-Bold' ),
                      hintText: "NIC",
                      hintStyle: TextStyle(fontSize: 12, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Medium' ),
                    ),
                  )
              ),
            ),
            Positioned(
              top: (Constant.screenHeight ) * 820,
              left: (Constant.screenWidth ) * 250,
              right: (Constant.screenWidth ) * 10,
              height: (Constant.screenHeight ) * 50,
              child: GestureDetector(
                child:Container(
                    decoration: BoxDecoration(
                        color: Palette.orangeLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        )
                    ),

                  child: Center(
                    child: Text(
                      "Update",
                      style:  TextStyle(
                          fontSize: 14.0,
                          fontFamily:  'HKGrotesk-Regular',
                          color: Colors.white
                      ),
                    ),
                  )
                ),
                onTap: (){
                  print("update");
                },
              )
            ),
          ],
        ),
      ),
      ),
    );
  }

  @override
  void dispose() {

    editFirstName.dispose();
    editLastName.dispose();
    editMobile.dispose();
    editCountry.dispose();
    editDateOfBirth.dispose();
    editNIC.dispose();
    editGender.dispose();

    super.dispose();

  }

//  Future<String> ProfileEdit() async{
////    String url = Constant.updateProfile;
//    print("profile Edit");
//    bool networkResults = await NetworkHelper.checkNetwork();
//
////    ////   // print(" post_text  > "+postTextController.text+"image_url   "+_image.toString()+"     video_url --- is_publc --->"+seletedPostActiveID.postActiveId+"  ---?  is_active  1");
//
//    if(networkResults){
//
//      Map<String, String> headers = {"Accept": "application/json", "Authorization": "Bearer "+ Constant.token};
//      Map<String, String> body = {
//        "first_name": editFirstName.text,
//        "last_name": editLastName.text,
//        "mobile_number": editMobile.text,
//        "gender": editGender.text,
//        "nic": editNIC.text,
//        "date_of_birth": editDateOfBirth.text,
//      };
//
//      var uri = Uri.parse(url);
//
//      // create multipart request
//      var request = new http.MultipartRequest("POST", uri);
//      request.headers.addAll(headers);
//      request.fields.addAll(body);
//
//
////      // add file to multipart
////      if(imageOfProfile != null){
////
////        // open a bytestream
////        var stream = new http.ByteStream(
////            DelegatingStream.typed(imageOfProfile.openRead()));
////        // get file length
////        var length = await imageOfProfile.length();
////
////        // string to uri
////
////        var multipartFile;
////        // multipart that takes file
////        multipartFile = new http.MultipartFile('profile_image', stream, length,
////            filename: basename(imageOfProfile.path));
////        request.files.add(multipartFile);
////      }
//
//      // send
//      var response = await request.send();
//      ////print(response.statusCode);
//
//      // listen for response
//      response.stream.transform(utf8.decoder).listen((value) {
//        ////print(value);
//      });
//
//      ////   // print(" profile ${response.statusCode}");
//      if (response.statusCode == 200) {
//
//        ////   // print("profile edit sucessfully !!!!");
//        setState(() {
//          Constant.profileListConstant.clear();
//          _isLoading = true;
//
//          getUserProfileData(context);
//        });
//
//      }else if(response.statusCode == 404){
//        //          _isLoading = false;
//        ////   // print("Data Not Found !");
//      }else if (response.statusCode == 500){
//
//        ////   // print("server Error");
//
//      }else{
//        ////print(response.toString());
//        ////   // print("Error while fetching data");
//      }
//      return null;
//    }else{
//      showAlert(context, "No Internet !");
//    }
//
//  }


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