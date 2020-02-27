import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

import 'Palette.dart';
import 'constant.dart';


class ProfileClass  extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ProfileExtend();
  }
}

class ProfileExtend extends State<ProfileClass> {

  MediaQueryData queryData;
  static bool isEdit = false;
  List data = new List();
  var userProfile;
  var innerUserProfile;
  var convertData;
  bool _isLoading  = false;
  int screenHeight;
  int screenWeight;
  int topBarHeight;
  String firstName = "";
  String lastName = "";
  String country = "";
  String mobile = "";
  TextEditingController editCountry =  TextEditingController();
  TextEditingController editMobile =  TextEditingController();
  TextEditingController editFirstName =  TextEditingController();
  TextEditingController editLastName =  TextEditingController();
  TextEditingController editCompany =  TextEditingController();

  bool _validateFirstName = false;
  bool _validateLastName= false;
  bool _validateMobile= false;
  bool _validateCountry= false;
  bool _validateCompany= false;

  var imageSource;
  File _image;
  bool _isImageSelected = false;
  String _content;

  final StreamController _controller = new StreamController<int>();
  Stream<int> _stream;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  BuildContext context;
  @override
  Widget build(BuildContext context) {
    context = context;

    return
      Scaffold(
        key: _scaffoldKey,
        body: _profileInnerBody(context),
      );
  }

  _profileInnerBody(BuildContext context) {

    queryData = MediaQuery.of(context);
    screenHeight = queryData.size.height.round();
    screenWeight = queryData.size.width.round();
    topBarHeight = ((screenWeight * 77) / 375).round();

    ////   // print("topBarHeight --> $topBarHeight");
    ////   // print("screenWeight --> $screenWeight");

    if (_isLoading) {
      return new Container(
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
                          color: index.isEven ? Color.fromRGBO(
                              67, 58, 141, 100.0) : Color.fromRGBO(
                              154, 214, 222, 100.0),
                          borderRadius: new BorderRadius.all(
                              Radius.circular(50.0))
                      ),
                    );
                  },
                ),
              ),
            ],
          )
      );
    }else{
      // print("image==== $_image");
      return Scaffold(
        body:SingleChildScrollView(
          child: Container(
            width: queryData.size.width,
            height: queryData.size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Palette.lightBlue, Palette.lightBlue, Palette.lightBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child:SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: topBarHeight,
//                child: More_Inner_Header.Other("Profile", true),
                    child:_setHeader(context),
                  ),
                  Expanded(
                    flex: screenHeight - topBarHeight,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(8.0),
                                topRight: const Radius.circular(8.0))),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 30,  top: 20,right:10),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: 60,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        GestureDetector(

                                          child:
                                          new Container( height: 60.0,
                                            width: 60.0,
                                            decoration: new BoxDecoration(
//                                              image: DecorationImage( image: _isImageSelected?
//                                            FileImage(_image):
////                                            NetworkImage(
////                                              Constant.ImageBaseURL + Constant.profileListConstant[0].userProfile.profileImage,
////                                            ),
//                                              fit: BoxFit.fill,
//                                            ),
                                              shape: BoxShape.circle, ),
                                          ),

//                                          child: Container(
//
//                                            height:60,
//                                            width: 60,
//                                            child: _isImageSelected?
//                                            Image
//
//                                            FileImage(_image):
//                                            NetworkImage(
//                                              Constant.ImageBaseURL + Constant.profileListConstant[0].userProfile.profileImage,
//                                            ),
//                                            CircleAvatar(
//                                              radius: 18,
//                                              backgroundImage: _isImageSelected? FileImage(_image):
//                                              NetworkImage(
//                                                Constant.ImageBaseURL + Constant.profileListConstant[0].userProfile.profileImage,
//                                              ),
//                                              backgroundColor: Palette.gray_color,
//                                            ),
//                                          ),
                                          onTap: (){
                                            // print("=======profileImage ${Constant.ImageBaseURL + Constant.profileListConstant[0].userProfile.profileImage}");
                                            if(isEdit){
                                              selectImage(context);}
                                          },
                                        ),
                                        Container(
//                                      padding: EdgeInsets.only(left: 10,  top: 10),
//                                      alignment: Alignment.center,
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
//                                          isEdite == false ?  twoTextEditView("Mobile" , "${_profileList[0].userProfile.mobileNumber}") : singleTextEditView("Mobile")
                                                Text(
                                                  "${_setUserName()}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'HKGrotesk-Medium',
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  "anushikadilmini@gmail.com",
                                                  style: TextStyle(
                                                      color: Palette.grayColor,
                                                      fontFamily: 'HKGrotesk-Medium',
                                                      fontSize: 12),
                                                ),
                                              ]),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // print("image====setImage $_image");

                                            if(!isEdit){
                                              setState(() {
                                                isEdit = true;
                                              });

                                            }else{
                                              _validateFirstNameFun(context);
                                              _validateLastNameFun(context);
                                              _validateMobileFun(context);
                                              _validateCountryFun(context);
                                              _validateCompanyFun(context);

                                              if(_validateFirstName && _validateLastName && _validateMobile && _validateCountry && _validateCompany){
                                                setState(() {
                                                  isEdit = false;
                                                  ////   // print("contain updated");
//                                                  _updateProfile(context);
                                                });
                                              }

//                                              profileEdit(editFirstName.text, editLastName.text,editMobile.text, editCountry.text);
                                            }

                                          },
                                          child:Container(
                                            width: 50,
                                            padding: EdgeInsets.only(left: 8 , top: 5, bottom: 20),
                                            child: isEdit == false ? Text("Edit",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Palette.brownishGrey,
                                                  fontFamily: 'HKGrotesk-Medium',
                                                  fontSize: 12),
                                            ) : Text("Save",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.lightBlue,
                                                  fontFamily: 'HKGrotesk-Medium',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                            alignment: Alignment.topLeft,
                                          ),

                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _setProfileBody(),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _stream = _controller.stream;
    new Future<void>.delayed(const Duration(seconds: 1)).then((_) {
      _controller.add(1);
    });
//    if( Constant.profileListConstant.isEmpty) {
//      _isLoading = true;
//      getUserProfileData(context);
//    }
  }

  Widget twoTextEditView(String leftText , String rightText ){

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(leftText , textAlign: TextAlign.left , style: TextStyle(
                  fontSize: 14, color: Colors.black,  fontFamily: 'HKGrotesk-Medium'
              ),) ,
            ),
          ),

          Expanded(
            child: Text(rightText, textAlign: TextAlign.right,style: TextStyle(
                fontSize: 12, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Regular'
            ),
            ),
          )
        ],
      ),
    );
  }

  Widget singleTextEditViewMobile(){
    editMobile = TextEditingController(text:"0765956264");

    return Container(
      margin: const EdgeInsets.only(left: 6.0,right: 6.0),
      child: new TextFormField(
        keyboardType: TextInputType.phone,
        controller: editMobile,
        cursorColor: Colors.black,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "Mobile",
          hintStyle: TextStyle(fontSize: 14, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Regular' ),
//          errorText: _validateMobile? 'Value Can\'t Be Empty' : null,
        ),
      ),
    );
  }

  Widget singleTextEditViewCountry(){
    editCountry = TextEditingController(text: "Sri Lanka");
    return Container(
      margin: const EdgeInsets.only(left: 6.0,right: 6.0),
      child: new TextFormField(
        controller: editCountry,
        cursorColor: Colors.black,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "Country",
          hintStyle: TextStyle(fontSize: 14, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Regular' ),
//          errorText: _validateCountry? 'Value Can\'t Be Empty' : null,
        ),
      ),
    );
  }

  Widget singleTextEditViewFirstName(){
    editFirstName = TextEditingController(text: "Anushika");
    return Container(
      margin: const EdgeInsets.only(left: 6.0,right: 6.0),
      child: new TextFormField(
        controller: editFirstName,
        cursorColor: Colors.black,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "First Name",
          hintStyle: TextStyle(fontSize: 14, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Regular' ),
//          errorText: _validateFirstName? 'Value Can\'t Be Empty' : null,
        ),
      ),
    );
  }

  Widget singleTextEditViewLastName(){
    editLastName = TextEditingController(text: "Dilmini");
    return Container(
      margin: const EdgeInsets.only(left: 6.0,right: 6.0),
      child: new TextFormField(
        controller: editLastName,
        cursorColor: Colors.black,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "Last Name",
          hintStyle: TextStyle(fontSize: 14, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Regular' ),
//          errorText: _validateLastName? 'Value Can\'t Be Empty' : null,
        ),
      ),
    );
  }

  Widget singleTextEditViewCompany(){
    editCompany = TextEditingController(text: "wad");
    return Container(
      margin: const EdgeInsets.only(left: 6.0,right: 6.0),
      child: new TextFormField(
        controller: editCompany,
        cursorColor: Colors.black,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "Company",
          hintStyle: TextStyle(fontSize: 14, color: Palette.brownishGrey,  fontFamily: 'HKGrotesk-Regular' ),
//          errorText: _validateCountry? 'Value Can\'t Be Empty' : null,
        ),
      ),
    );
  }

  _setUserName(){
    String userName = "Anushika" ;
//    Constant.profileListConstant[0].name;
    if(userName.length > 20){
      userName = userName.substring(0,20);
      return userName;
    }else{
      return userName;
    }
  }

  _validateLastNameFun(BuildContext context){
    if(editLastName.text.isEmpty) {
      _showAlertDialog('Last Name can not be empty',context);

    }else{
      _validateLastName=true;
    }
  }

  _validateFirstNameFun(BuildContext context){
    if(editFirstName.text.isEmpty) {
      _showAlertDialog('First Name can not be empty',context);
    }else{
      _validateFirstName = true;
    }
  }

  _validateCountryFun(BuildContext context){
    if(editCountry.text.isEmpty){
      _showAlertDialog('Country can not be empty',context);
    }else{
      _validateCountry = true;
    }
  }

  _validateMobileFun(BuildContext context){
    if(editMobile.text.isEmpty){
      _showAlertDialog('Mobile can not be empty',context);
    }else{
      _validateMobile = true;
    }
  }

  _validateCompanyFun(BuildContext context){
    if(editCompany.text.isEmpty) {
      _showAlertDialog('Company can not be empty',context);

    }else{
      _validateCompany=true;
    }
  }

  _showAlertDialog(String message,BuildContext context){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Alert!')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment
                  .center,
              crossAxisAlignment: CrossAxisAlignment
                  .center,
              children: <Widget>[

                Text(
                  '$message',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                  ),

                ),
                Text(
                  '                            ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),

                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child:FlatButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context,
                                rootNavigator: true)
                                .pop('dialog');
                          }),
                    ),
                    Expanded(
                        flex: 1,
                        child:FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  _setProfileBody() {
    if (isEdit) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
                height: 60,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/more_main_menu/edittextbg.png"),
                      fit: BoxFit.fill
                  ),
                ),
                child: singleTextEditViewFirstName()
            ),

            new Container(
              height: 50,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/more_main_menu/edittextbg.png"),
                    fit: BoxFit.fill
                ),
              ),
              child: singleTextEditViewLastName(),
            ),

            new Container(
                height: 50,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/more_main_menu/edittextbg.png"),
                      fit: BoxFit.fill
                  ),
                ),
                child:
                singleTextEditViewMobile()
            ),
            new Container(
                height: 50,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/more_main_menu/edittextbg.png"),
                      fit: BoxFit.fill
                  ),
                ),
                child: singleTextEditViewCountry()
            ),
            new Container(
                height: 50,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/more_main_menu/edittextbg.png"),
                      fit: BoxFit.fill
                  ),
                ),
                child: singleTextEditViewCompany()
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            new Container(
                height: 50,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/more_main_menu/edittextbg.png"),
                      fit: BoxFit.fill
                  ),
                ),
                child: twoTextEditView(
                    "Mobile", "0765956264")
            ),
            new Container(
                height: 50,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/more_main_menu/edittextbg.png"),
                      fit: BoxFit.fill
                  ),
                ),
                child: twoTextEditView(
                    "Country", "Sri Lanka")
            ),
            new Container(
                height: 50,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/more_main_menu/edittextbg.png"),
                      fit: BoxFit.fill
                  ),
                ),
                child: twoTextEditView(
                    "Company", "wad")
            ),
          ],
        ),
      );
    }
  }

//  _updateProfile(BuildContext context){
//    setState(() {
//      _isLoading= true;
//      if(editFirstName.text !="${ Constant.profileListConstant[0].userProfile.firstName}" || editLastName.text !="${ Constant.profileListConstant[0].userProfile.lastName}" ||  editMobile.text !="${ Constant.profileListConstant[0].userProfile.mobileNumber}" || editCountry.text !="${ Constant.profileListConstant[0].userProfile.country}" || editCompany.text !="${ Constant.profileListConstant[0].userProfile.company} " ){
//
//        if(_image != null){
//          profileEdit(editFirstName.text,editLastName.text,editMobile.text,editCountry.text,editCompany.text, _image, context);
//          ////   // print("${_image.path}.");
//        }else{
//          profileEdit(editFirstName.text,editLastName.text,editMobile.text,editCountry.text,editCompany.text, null, context);
//        }
//      }else if(_image != null){
//        profileEdit(editFirstName.text,editLastName.text,editMobile.text,editCountry.text,editCompany.text, _image, context);
//        ////   // print("${_image.path}.");
//      }else{
//        _isLoading= false;
//      }
//    });
//  }

//  Future<String> profileEdit(String firstName, String lastName, String mobileNumber,String country,String company,File imageOfProfile, BuildContext context) async{
//    String url = Constant.updateProfile;
//    ////   // print("profile Edit");
//    bool networkResults = await networkHelper.checkNetwork();
//
////    ////   // print(" post_text  > "+postTextController.text+"image_url   "+_image.toString()+"     video_url --- is_publc --->"+seletedPostActiveID.postActiveId+"  ---?  is_active  1");
//
//    if(networkResults){
//
//      Map<String, String> headers = {"Accept": "application/json", "Authorization": "Bearer "+ Constant.token};
//      Map<String, String> body = {"first_name": firstName,
//        "last_name": lastName,
//        "mobile_number": mobileNumber,
//        "country": country,
//        "company": company,
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
//      // add file to multipart
//      if(imageOfProfile != null){
//
//        // open a bytestream
//        var stream = new http.ByteStream(
//            DelegatingStream.typed(imageOfProfile.openRead()));
//        // get file length
//        var length = await imageOfProfile.length();
//
//        // string to uri
//
//        var multipartFile;
//        // multipart that takes file
//        multipartFile = new http.MultipartFile('profile_image', stream, length,
//            filename: basename(imageOfProfile.path));
//        request.files.add(multipartFile);
//      }
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
////        setState(() {
////          Constant.profileListConstant.clear();
////          _isLoading = true;
////
////          getUserProfileData(context);
////        });
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
//      ////   // print("////print ---> ////print");
//      _showAlertDialog("No Internet !", context);
//    }
//
//  }



//  Future<String> getUserProfileData(BuildContext context) async {
//    String url = Constant.profile;
//
//    bool networkResults = await networkHelper.checkNetwork();
//
//    if (networkResults) {
//      final response = await http.get(
//        Uri.encodeFull(url),
//        headers: {
//          "Accept": "application/json",
//          "Authorization": "Bearer " + Constant.token
//        },
//      );
//
//      int responseCode = response.statusCode;
//      if (responseCode == 200) {
//        setState(() {
//          _isImageSelected = false;
//          var convertData = json.decode(response.body);
//          try{
//            var profileList =  ProfileUserProfile.fromJson(convertData['user_profile']);
//            Constant.profileListConstant.add(profileList);
//            Constant.username = profileList.name;
//            Constant.userImage = "${Constant.ImageBaseURL}"+profileList.userProfile.profileImage;
//
//          }catch(Exception){
//            ////   // print("Exception --> "+Exception);
//          }
//          _isLoading = false;
//
//        });
//      }else if(responseCode == 404){
//        setState(() {
//          _isLoading = false;
//          ////   // print("Data Not Found !");
//        });
//      }else if (responseCode == 500){
//        _isLoading = false;
//        ////   // print("server Error");
//
//      }else{
//        setState(() {
//          _isLoading = false;
////          //   // print("Error while fetching data");
//        });
//      }
//      return "sucess";
//    }else{
//      showSnackbar(context, "No Internet ! ");
//    }
//
//  }

  showSnackbar(BuildContext context, String msg){
    final snackBar = SnackBar(content: Text(msg),backgroundColor: Palette.darkGrey,);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


  void selectImage(BuildContext context){

    var alert = new AlertDialog(
      title: Text("Please select a method"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new FlatButton(
              onPressed: (){
                imageSource = ImageSource.camera;
                getImage();
                _close(context);
//                Navigator.pop(context);
              },
              child: Text('Camera')
          ),
          new FlatButton(
              onPressed: (){
                ////   // print("Image Gallery ");
                imageSource = ImageSource.gallery;
                getImage();
//                Navigator.pop(context);
                _close(context);
              },
              child: Text('Image Gallery')
          ),
        ],
      ),
      actions: <Widget>[
      ],
    );
    showDialog(context: context,
        builder: (_) {
          return alert;
        });
  }

  Future getImage() async {
    // print("camera");
    var image;


    if (Platform.isIOS){
      image = await ImagePicker.pickImage(source: imageSource);

    }else{
      image = await ImagePicker.pickImage(source: imageSource,
          maxWidth: 2300,
          maxHeight: 1500);

    }

    // print("image======= $image");


    if(image != null){
      setState(() {
        _image = image;
        _isImageSelected = true;
      });
    }


  }

  @override
  void dispose() {

    editFirstName.dispose();
    editLastName.dispose();
    editMobile.dispose();
    editCountry.dispose();

    super.dispose();

  }

  _setHeader(BuildContext context){
    return new Container(
       child:Center(
         child: Text(
           "Profile",
           textAlign: TextAlign.center,
           style: TextStyle(
               fontFamily: 'HKGrotesk-SemiBold',
               color: Palette.grayColor,
               fontSize: ((((queryData.size.height - ((queryData.size.width / 375) * 92)) / 2) / 5)/64)*17),
         ),
       )

    );
  }


  _checkContent(String content){
    if(content != "null"){
      return _content = content;
    }else{
      return _content = "";
    }

  }


  void _close(BuildContext context) {

    // print(" ------------------- close ------------------------------------");

    Navigator.of(context,
        rootNavigator: true)
        .pop('dialog');

  }




}

