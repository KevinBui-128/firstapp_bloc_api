import 'dart:async';
import 'package:firstapp_bloc_api/data/repository/getUserInfo.dart';
import 'package:firstapp_bloc_api/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firstapp_bloc_api/blocs/loginBloc/bloc.dart';
import 'package:firstapp_bloc_api/configs/configs.dart';
import 'package:firstapp_bloc_api/data/repository/loginRepository.dart';
import 'package:firstapp_bloc_api/validations/validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    try {
      if (event is LoginButtonPressedEvent) {
        yield LoginLoadingState();
        if (await Validations.isConnectedNetwork()) {
          if (event.loginStream
              .isValidInfo(event.id.trim(), event.password.trim())) {
            final result = await postLogin(
                passWord: Unity.hashPassWord(event.password.trim()),
                userName: event.id.trim());
            if (result == 1) {
              yield LoginSuccessState();
              //Get userinfo sau khi login thành công
              print(ConfigsApp.idUser);
              await getUserInfo(
                  idUser: ConfigsApp.idUser);
              Navigator.of(event.context).pushReplacementNamed("/home");
            } else if (result == 0) {
              if (ConfigsApp.messageServerModel != null &&
                  ConfigsApp.messageServerModel.length > 0) {
                yield LoginFailureState(
                    errorCode: ConfigsApp.messageServerModel[0]?.code ??
                        ConfigsApp.errorUnknownCode,
                    fieldName:
                    ConfigsApp.messageServerModel[0]?.fieldName ?? "",
                    error: ConfigsApp.messageServerModel[0]?.message ?? "",
                    alertType: AlertType.error);
              } else {
                yield LoginFailureState(
                    errorCode: ConfigsApp.errorUnknownCode,
                    fieldName: 
                    ConfigsApp.messageServerModel[0]?.fieldName ?? "",
                    error: "Lỗi không xác định",
                    alertType: AlertType.error);
              }
            }
          } else {
            yield LoginFaileValidationState();
          }
        } else {
          yield LoginFailureState(
              errorCode: ConfigsApp.errorUnknownCode,
              fieldName: "",
              error: "Không có kết nối mạng",
              alertType: AlertType.warning);
        }
      } else if (event is ChangeToForgetPassEvent) {
        Navigator.of(event.context).pushNamed('/authenphone');
      } else if (event is ShowPassButtonPressedEvent) {
        yield ShowPassState(showPass: !event.showPass);
      } else if (event is RegisterButtonPressedEvent) {
        yield ChangeToSignupState();
        Navigator.of(event.context).pushNamed("/signup");
        yield LoginInitialState();
      }
    } catch (e) {
      yield LoginFailureState(
          fieldName: "",
          errorCode: ConfigsApp.errorUnknownCode,
          error: e.toString(),
          alertType: AlertType.error);
    }
  }
}
