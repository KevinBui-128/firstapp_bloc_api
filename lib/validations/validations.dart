import 'dart:io';

import 'package:firstapp_bloc_api/configs/configs.dart';
import 'package:firstapp_bloc_api/modules/sharedPreferenceModule.dart';

class Validations {
  static Future<bool> isLogined() async {
    try {
      String key = SpUtil.getString('auth_token');
      if (key == null || key.length == 0) {
        return false;
      } else {
        ConfigsApp.idUser = SpUtil.getString("id");
        ConfigsApp.token = key;
        return true;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static bool isUrl(String text) {
    RegExp reg = new RegExp(
        r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?",
        caseSensitive: false);
    if (reg.hasMatch(text)) {
      return true;
    }
    return false;
  }

  static Future<bool> isConnectedNetwork() async {
    bool status = false;
    try {
      final result = await InternetAddress.lookup('unionist.pikatech.vn')
          .timeout(const Duration(seconds: 20));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        status = true;
        return status;
      }
    } on SocketException catch (_) {
      status = false;
      return status;
    }
    return status;
  }

  static bool isValidText(String text) {
    return text != null && text.length > 0;
  }

  static bool isValidUser(String user) {
    return user != null && user.length > 0;
  }

  static bool isValidPass(String pass) {
    return pass != null && pass.length >= 4 && pass.length <= 50;
  }
}
