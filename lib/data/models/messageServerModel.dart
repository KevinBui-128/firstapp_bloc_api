import 'package:firstapp_bloc_api/configs/configs.dart';

class MessageServerModel {
  int code;
  String fieldName;
  String message;
  MessageServerModel({this.code, this.fieldName = "", this.message});
  static List<MessageServerModel> fromJson(Map<String, dynamic> json) {
    List<MessageServerModel> rs = new List();
    var results = json['message'];
    for (var item in results) {
      var event = new MessageServerModel(
        code: item['code'] == null
            ? ConfigsApp.errorUnknownCode
            : item['code'] as int,
        fieldName: item['fieldName'] == null ? "" : item['fieldName'],
        message: item['message'] == null ? "" : item['message'] as String,
      );
      rs.add(event);
    }
    return rs;
  }
}
