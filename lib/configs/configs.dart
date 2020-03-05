
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstapp_bloc_api/data/models/messageServerModel.dart';
import 'package:firstapp_bloc_api/data/models/userInfoModel.dart';

class ConfigsApp {
// API Config
  static String appId = "vn.pikatech.congress";
  static String baseUrl = "http://unionist.pikatech.vn:5010";
  static String testbaseUrl = "http://unionist.pikatech.vn:5010";
  static String urlLogin = "/login";
  static String urlRegister = "/register";
  static String urlGetUserInfo = "/getuserinfo";
  static String urlRegisterResidence = "/registerResidence";
  // Config App
  static FirebaseAuth auth;
  static List<int> imageUser = [];
  static UserInfoModel userInfoModel;
  static String versionApp = "";
  static bool isDebugMode = false;
//  static List<CenterModel> listCenters = [];
  static String token = "";
  static String idUser = "";
  static String userName = "";
  static int errorUnknownCode = 2000;
  static List<MessageServerModel> messageServerModel = [];
}
