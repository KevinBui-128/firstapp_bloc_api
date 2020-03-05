import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:firstapp_bloc_api/data/models/userInfoModel.dart';
import '../../configs/configs.dart';
import '../models/messageServerModel.dart';

Future<int> getUserInfo({
  @required String idUser,
}) async {
  try {
    Map<String, dynamic> body = {
      "id": idUser,
    };
    var finalBody = json.encode(body);
    Response response = await post(
        ConfigsApp.isDebugMode
            ? ConfigsApp.testbaseUrl + ConfigsApp.urlGetUserInfo
            : ConfigsApp.baseUrl + ConfigsApp.urlGetUserInfo,
        body: finalBody,
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['code'] == 200) {
        ConfigsApp.userInfoModel = UserInfoModel.fromJson(data);
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
