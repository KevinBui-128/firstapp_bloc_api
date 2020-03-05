import 'dart:convert';
import 'package:firstapp_bloc_api/configs/configs.dart';
import 'package:firstapp_bloc_api/data/models/messageServerModel.dart';
import 'package:firstapp_bloc_api/data/models/registerModel.dart';
import 'package:firstapp_bloc_api/modules/sharedPreferenceModule.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

Future<int> postRegister({@required SignUpModel signUpModel}) async {
  try {
    var finalBody = json.encode(signUpModel.toJson());
    Response response = await post(
        ConfigsApp.isDebugMode
            ? ConfigsApp.testbaseUrl + ConfigsApp.urlRegister
            : ConfigsApp.baseUrl + ConfigsApp.urlRegister,
        body: finalBody,
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['code'] == 200) {
        SpUtil.setString("username", signUpModel?.userName ?? "");
        SpUtil.setString('password', signUpModel?.password ?? "");
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
