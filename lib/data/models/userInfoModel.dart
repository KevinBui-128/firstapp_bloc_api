import 'dart:convert';

class UserInfoModel {
  int code;
  Data data;
  List<Message> message;
  bool success;

  UserInfoModel({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory UserInfoModel.fromRawJson(String str) =>
      UserInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    code: json["code"] == null ? null : json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"] == null
        ? null
        : List<Message>.from(
        json["message"].map((x) => Message.fromJson(x))),
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "data": data == null ? null : data.toJson(),
    "message": message == null
        ? null
        : List<dynamic>.from(message.map((x) => x.toJson())),
    "success": success == null ? null : success,
  };
}

class Data {
  UserInfo userInfo;

  Data({
    this.userInfo,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userInfo: json["userInfo"] == null
        ? null
        : UserInfo.fromJson(json["userInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "userInfo": userInfo == null ? null : userInfo.toJson(),
  };
}

class UserInfo {
  String address;
  double birthday;
  dynamic centerCode;
  dynamic classCode;
  String districtId;
  String email;
  String facebookId;
  String fullName;
  String id;
  String idCard;
  String job;
  String password;
  String phoneNo;
  String positionCode;
  String provinceCode;
  String roleId;
  String roleName;
  int sex;
  String urlAvt;
  String urlIdCardImgB;
  String urlIdCardImgF;
  String urlUserFaceImg;
  String userName;

  UserInfo({
    this.address,
    this.birthday,
    this.centerCode,
    this.classCode,
    this.districtId,
    this.email,
    this.facebookId,
    this.fullName,
    this.id,
    this.idCard,
    this.job,
    this.password,
    this.phoneNo,
    this.positionCode,
    this.provinceCode,
    this.roleId,
    this.roleName,
    this.sex,
    this.urlAvt,
    this.urlIdCardImgB,
    this.urlIdCardImgF,
    this.urlUserFaceImg,
    this.userName,
  });

  factory UserInfo.fromRawJson(String str) =>
      UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    address: json["address"] == null ? null : json["address"],
    birthday: json["birthday"] == null ? null : json["birthday"],
    centerCode: json["centerCode"],
    classCode: json["classCode"],
    districtId: json["districtId"] == null ? null : json["districtId"],
    email: json["email"] == null ? null : json["email"],
    facebookId: json["facebookId"] == null ? null : json["facebookId"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    id: json["id"] == null ? null : json["id"],
    idCard: json["idCard"] == null ? null : json["idCard"],
    job: json["job"] == null ? null : json["job"],
    password: json["password"] == null ? null : json["password"],
    phoneNo: json["phoneNo"] == null ? null : json["phoneNo"],
    positionCode:
    json["positionCode"] == null ? null : json["positionCode"],
    provinceCode:
    json["provinceCode"] == null ? null : json["provinceCode"],
    roleId: json["roleID"] == null ? null : json["roleID"],
    roleName: json["roleName"] == null ? null : json["roleName"],
    sex: json["sex"] == null ? null : json["sex"],
    urlAvt: json["url_avt"] == null ? null : json["url_avt"],
    urlIdCardImgB:
    json["url_idCardImgB"] == null ? null : json["url_idCardImgB"],
    urlIdCardImgF:
    json["url_idCardImgF"] == null ? null : json["url_idCardImgF"],
    urlUserFaceImg:
    json["url_userFaceImg"] == null ? null : json["url_userFaceImg"],
    userName: json["userName"] == null ? null : json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "address": address == null ? null : address,
    "birthday": birthday == null ? null : birthday,
    "centerCode": centerCode,
    "classCode": classCode,
    "districtId": districtId == null ? null : districtId,
    "email": email == null ? null : email,
    "facebookId": facebookId == null ? null : facebookId,
    "fullName": fullName == null ? null : fullName,
    "id": id == null ? null : id,
    "idCard": idCard == null ? null : idCard,
    "job": job == null ? null : job,
    "password": password == null ? null : password,
    "phoneNo": phoneNo == null ? null : phoneNo,
    "positionCode": positionCode == null ? null : positionCode,
    "provinceCode": provinceCode == null ? null : provinceCode,
    "roleID": roleId == null ? null : roleId,
    "roleName": roleName == null ? null : roleName,
    "sex": sex == null ? null : sex,
    "url_avt": urlAvt == null ? null : urlAvt,
    "url_idCardImgB": urlIdCardImgB == null ? null : urlIdCardImgB,
    "url_idCardImgF": urlIdCardImgF == null ? null : urlIdCardImgF,
    "url_userFaceImg": urlUserFaceImg == null ? null : urlUserFaceImg,
    "userName": userName == null ? null : userName,
  };
}

class Message {
  int code;
  dynamic message;

  Message({
    this.code,
    this.message,
  });

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    code: json["code"] == null ? null : json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message,
  };
}
