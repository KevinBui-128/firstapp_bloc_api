import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firstapp_bloc_api/data/models/registerModel.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './bloc.dart';
import '../../configs/configs.dart';
import '../../utils/utils.dart';
import '../../validations/validations.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  @override
  SignupState get initialState => InitialSignupState();

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    try {
      if (event is RegisterButtonPressedEvent) {
        yield SignUpLoadingState();
        if (await Validations.isConnectedNetwork()) {
          if (event.signUpStream.isValidInfo(
            username: event.userName,
            pass: event.password,
          )) {
            String hashPass = Unity.hashPassWord(event.password);
            SignUpModel signUpModel = new SignUpModel(
              userName: event.userName,
              password: hashPass,
              platform: Platform.operatingSystem.toString(),
            );
            Navigator.of(event.context)
                .pushReplacementNamed("/home", arguments: signUpModel);
          } else {
            yield SignUpFaileValidationState();
          }
        } else {
          yield SignUpFailureState(
              errorCode: ConfigsApp.errorUnknownCode,
              fieldName: "",
              error: "Không có kết nối mạng",
              alertType: AlertType.warning);
        }
      } else if (event is BackToLoginButtonEvent) {
        Navigator.of(event.context).pop();
        yield InitialSignupState();
      } else if (event is ShowPassEvent) {
        yield ShowPassState(showPass: !event.showPass);
      } else if (event is ShowRePassEvent) {
        yield ShowRePassState(showRePass: !event.showRePass);
      }
    } catch (e) {
      yield SignUpFailureState(
          errorCode: ConfigsApp.errorUnknownCode,
          error: e.toString(),
          fieldName: "",
          alertType: AlertType.error);
    }
  }
}