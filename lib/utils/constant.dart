import 'package:shared_preferences/shared_preferences.dart';

class Constant {

  static String baseURL = "http://www.app.etsteas.co.uk/api/";
  static String ImageBaseURL = "http://www.app.etsteas.co.uk/";

  static  SharedPreferences sp;
  static String login = baseURL+"login";
  static String signUp = baseURL+"register";

  static double screenHeight = 0;
  static double screenWidth = 0;


  static double textScalar = 0.70;

}