import 'dart:async';

import 'package:firstapp_bloc_api/validations/validations.dart';

class LoginStream {
  StreamController _userController = new StreamController.broadcast();
  StreamController _passController = new StreamController.broadcast();
  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;
  void userNameChange(String username) {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
    }
    if (Validations.isValidUser(username)) {
      _userController.sink.add("OK");
    }
  }

  void passWordChange(String pass) {
    if (!Validations.isValidPass(pass)) {
      _passController.sink.addError("Mật khẩu phải có từ 4-8 ký tự");
    }
    if (Validations.isValidPass(pass)) {
      _passController.sink.add("Ok");
    }
  }

  bool isValidInfo(String username, String pass) {
    bool status = true;
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError("Tài khoản phải có từ 8-30 ký tự");
      status = false;
    }
    if (Validations.isValidUser(username)) {
      _userController.sink.add("Ok");
    }

    if (!Validations.isValidPass(pass)) {
      _passController.sink.addError("Mật khẩu phải có từ 4-8 ký tự");
      status = false;
    }
    if (Validations.isValidPass(pass)) {
      _passController.sink.add("Ok");
    }
    return status;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}
