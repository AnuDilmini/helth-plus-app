import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_plus/ui/registration.dart';

class HomeScreen extends StatelessWidget {

  final FirebaseUser user;
  HomeScreen({this.user});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 1), () async {

      if (user != null) {

        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Registration(user: user)
        ));

      } else {

        print("Error");

      }

    });

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            SizedBox(height: 16,),
            Text("${user.phoneNumber}", style: TextStyle(color: Colors.grey, ),),
          ],
        ),
      ),
    );

  }

}