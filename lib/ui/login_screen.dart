import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_plus/ui/registration.dart';
import 'package:health_plus/utils/Palette.dart';
import 'package:health_plus/utils/constant.dart';

import '../home.dart';


class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  MediaQueryData queryData;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  Future<bool> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          print("asdfsgds********************");


          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Enter\nVerification code",
                  style: TextStyle(color: Color(0xFFFF8111),
                   fontSize: 14),),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Color(0xFFFF8111),
                      onPressed: () async{
                        final code = _codeController.text.trim();
                        AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);

                        AuthResult result = await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;


                        if(user != null){

                          showSnackBar(context, "You are Logged in succesfully");
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Registration(user: user,)
                          ));
                        }else{
                          print("Error");
                        }

//                        if(user != null ){
//                          Navigator.push(context, MaterialPageRoute(
//                              builder: (context) => HomeScreen(user: user,)
//                          ));
//                        }else{
//                          print("Error");
//                        }
                      },
                    ),
//                    FlatButton(
//                      child: Text("Back"),
//                      textColor: Colors.white,
//                      color: Color(0xFFFF8111),
//                      onPressed: () async{
//
//                      },
//                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }

  showSnackBar(BuildContext context, String msg){
    final snackBar = SnackBar(content: Text(msg),backgroundColor: Palette.darkGrey,);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {

    queryData = MediaQuery.of(context);
    Constant.screenWidth = queryData.size.width / 414;
    Constant.screenHeight = queryData.size.height/812;
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            height: Constant.screenHeight * 812,
            width: Constant.screenWidth * 414,

//            decoration: new BoxDecoration(
//              gradient: LinearGradient(
//                begin: Alignment.topLeft,
//                end: Alignment.bottomRight,
//                stops: [0.0, 0.4, 0.9],
//                colors: [
//                  Color(0xFFFF8111),
//                  Color(0xFFFC663C),
//                  Color(0xFFFF3F1A),
//                ],
//              ),
//            ),
            padding: EdgeInsets.only(left: 32, right: 32,
            top: Constant.screenHeight * 120 ),
            child: Form(
              autovalidate: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Enter\nMobile Number", style: TextStyle(color:  Color(0xFFFF8111), fontSize: 30, fontWeight: FontWeight.w500),),
                    SizedBox(height: Constant.screenHeight * 150),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color:  Color(0xFFFF8111),
                              width: 1.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color:  Color(0xFFFF8111),
                              width: 1.0)
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "+94 Mobile Number",


                      ),
                      controller: _phoneController,
                    ),
                    SizedBox(height: Constant.screenHeight * 40,),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius
                          .circular(8.0),
                        ),
                        child: Text("LOGIN",
                          style: TextStyle(color:  Colors.white, fontSize: 18, fontWeight: FontWeight.w500)
                      ),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(16),
                        onPressed: () {
                          print("test");
                          final phone = _phoneController.text.trim();
                          loginUser(phone, context);
                        },
                        color: Color(0xFFFF8111),
                      ),
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}