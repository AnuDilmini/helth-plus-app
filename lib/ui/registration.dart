import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_plus/drawer/bottom_nav.dart';
import 'package:health_plus/ui/registration_test.dart';
import 'package:health_plus/utils/network_helper.dart';
import 'package:http/http.dart' as http;


class Registration extends StatefulWidget{

  _RegistrationState createState() => _RegistrationState();
  final FirebaseUser user;
  Registration({this.user});
}

class _RegistrationState extends State<Registration> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();



  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            /////////////  background/////////////
            new Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.4, 0.9],
                  colors: [
                    Color(0xFFFF8333),
                    Color(0xFFFC663C),
                    Color(0xFFFF3F1A),
                  ],
                ),
              ),
            ),

            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /////////////// name////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: firstNameController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Firstname",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: lastNameController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Lastname",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// Email ////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: mailController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ),
                                hintText: "Email ",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// password ////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.grey,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              enabled: false,
                              controller: phoneController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mobile_screen_share,
                                  color: Colors.grey,
                                ),
                                labelText: "0765956264",
                                labelStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                                hintText: "Phone",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),


                            /////////////// SignUp Button ////////////

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      _isLoading
                                          ? 'Creating...'
                                          : 'Create account',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Colors.red,
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(20.0)),
                                  onPressed: (){

//                                    signUp(context);
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => BottomNavigation(index: 0)
                                    ));
                                  }
//                                  _isLoading ? null : _handleLogin
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> signUp(BuildContext context) async {
    print("signup");
    String url = 'http://10.0.2.2:8080/api/v1/users/add';
    var response;

    bool networkResults = await NetworkHelper.checkNetwork();

    if (networkResults) {
      try {
         print("url $url");
          response =
              await http.post(
                  url,
              body: {
                "first_name": "Anushika",
                "name": "07198093930",
                "last_name": "Dilmini123",
                "email": "anushikadilmini@gmail.com",
                "passowrd": "12345678"
              }
          );
         print("url*** $url");
//        int responseCode = response.statusCode;
//        print(" --- response 1 ----- : "+responseCode.toString());
//         var convertData = json.decode(response.body);
//         print(" --- response ----- : "+response.body);

//        if (responseCode == 200) {
////          var convertData = json.decode(response.body);
////             // print(" --- response ----- : "+convertData.toString());
////          var userP = userMFromJson(response.body);
////          String token = convertData['access_token'];
////          saveUserProfile(userP);
////          saveToken(token, userP.user.name, userP.user.userProfile.profileImage, userP.user.id);
////          //   // print("name -->"+userP.user.userProfile.firstName);
////          //   // print("token =- >"+token);
//          setState(() {
////            _success = true;
////            _isLoading = false;
////            _showAlertDialog(context,"English Tea Shop will now review your details and approve your account");
//////            Constant.selectedMainIndexPage = 2;
//////            Navigator.pushAndRemoveUntil( context, MaterialPageRoute( builder: (BuildContext context) => callMainWidget(token), ), ModalRoute.withName('/'));
//            //   // print("Successs !!!");
//          });
//        } else if (responseCode == 425) {
//          setState(() {
////            _isLoading = false;
////            //   // print("User Not Found !");
////            showSnackbar(context,"Email alreay exist !");
//          });
//        } else {
//          setState(() {
////            _isLoading = false;
////            //   // print("Error while fetching data" + response.body);
////            showSnackbar(context,"Server error ! ");
//          });
//        }
        return "Success";
      } catch (Exception) {
        setState(() {
//          _isLoading = false;
        print("Exception");
              print("Exception ----> : " + Exception.toString());
//          showSnackbar(context," Error !");
        });

      }
    }else{
      setState(() {
//        _isLoading = false;
//        //   // print("No Internet !! ");
//        showSnackbar(context,"No Internet !! ");
      });
//      showAlert(context, "No Internet !!");

    }
  }


  void _handleLogin() async {
//    setState(() {
//      _isLoading = true;
//    });
//    var data = {
//      'name' : widget.user.phoneNumber,
//      'first_name' : firstNameController.text,
//      'last_name' : lastNameController.text,
//      'email' : mailController.text,
//      'password' : passwordController.text,
//
//    };
//    var res = await CallApi().postData(data, 'add');
//    var body = json.decode(res.body);
//    print(body);
//
//
//    setState(() {
//      _isLoading = false;
//    });
  }


//  Future<Post> createPost(String url, {Map body}) async {
//    return http.post(url, body: body).then((http.Response response) {
//      final int statusCode = response.statusCode;
//
//      if (statusCode < 200 || statusCode > 400 || json == null) {
//        throw new Exception("Error while fetching data");
//      }
//      return Post.fromJson(json.decode(response.body));
//    });
//
//
//}
}
