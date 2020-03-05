import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firstapp_bloc_api/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class ImagePath {
  static String cover = 'assets/images/cover.jpg';
  static String cover2 = 'assets/images/cover2.jpg';
  static String logoCon = 'assets/images/logo.png';
}

class Unity {
  static replaceStringUrl(String url) {
    String replacedToken =
        url.replaceFirst(RegExp('1furlid'), ConfigsApp.token);
    String replaceFinal =
        replacedToken.replaceFirst(RegExp('2furlid'), ConfigsApp.idUser);
    return replaceFinal;
  }

  static String getExtension(String path) {
    return p.extension(path);
  }

  static String getNameFile(String path) {
    return p.basename(path);
  }

  static openDrawer(BuildContext context) {
    final ScaffoldState scaffoldState = context.findRootAncestorStateOfType();
    scaffoldState.openDrawer();
  }

  static String hashPassWord(String password) {
    var bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }
}

class Dimension {
  static double height = 0.0;
  static double witdh = 0.0;

  static double getWidth(double size) {
    return witdh * size;
  }

  static double getHeight(double size) {
    return height * size;
  }
}
