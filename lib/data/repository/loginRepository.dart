import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:firstapp_bloc_api/configs/configs.dart';
import 'package:firstapp_bloc_api/data/models/messageServerModel.dart';
import 'package:firstapp_bloc_api/modules/sharedPreferenceModule.dart';

Future<int> postLogin({
  String userName,
  String passWord,
}) async {
  try {
    Map<String, dynamic> body = {
      "id": userName,
      "password": passWord,
      "platform": Platform.operatingSystem.toString()
    };
    var finalBody = json.encode(body);
    Response response = await post(
        ConfigsApp.isDebugMode
            ? ConfigsApp.testbaseUrl + ConfigsApp.urlLogin
            : ConfigsApp.baseUrl + ConfigsApp.urlLogin,
        body: finalBody,
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['code'] == 200) {
        debugPrint('DATA LOGIN: $data');
        SpUtil.setString("id", userName);
        SpUtil.setString('password', passWord);
        ConfigsApp.token = data['data']['login']['auth_token'].toString();
        ConfigsApp.idUser = data['data']['login']['id'].toString();
        print(data.toString());
        return 1;
      } else {
        ConfigsApp.messageServerModel.clear();
        List<MessageServerModel> lstMessage = List();
        lstMessage = MessageServerModel.fromJson(json.decode(response.body));
        ConfigsApp.messageServerModel.addAll(lstMessage);
        return 0;
      }
    } else {
      ConfigsApp.messageServerModel.clear();
      ConfigsApp.messageServerModel.add(new MessageServerModel(
          code: ConfigsApp.errorUnknownCode, message: "Lỗi kết nối mạng"));
      return 0;
    }
  } catch (e) {
    print(e.toString());
    ConfigsApp.messageServerModel.clear();
    ConfigsApp.messageServerModel.add(new MessageServerModel(
        code: ConfigsApp.errorUnknownCode, message: e.toString().trim()));
    // FlutterCrashlytics()
    //     .log(e.toString(), priority: 200, tag: 'Error in PostLogin');
    return 0;
  }
}
