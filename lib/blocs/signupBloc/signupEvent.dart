import 'package:equatable/equatable.dart';
import 'package:firstapp_bloc_api/streams/signupStream/signupStream.dart';
import 'package:flutter/widgets.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class RegisterButtonPressedEvent extends SignupEvent {
  final String userName;
  final String password;
  final String platform;
  final BuildContext context;

  final SignUpStream signUpStream;

  RegisterButtonPressedEvent({
    @required this.userName,
    @required this.password,
    @required this.platform,
    @required this.context,
    this.signUpStream,
  });
  @override
  List<Object> get props => [
    userName,
    password,
    platform,
    signUpStream
  ];
}

class FetchDataEvent extends SignupEvent {
  @override
  List<Object> get props => [];
}

class ChangeDropDownEvent extends SignupEvent {
  final String idProvinces;
  ChangeDropDownEvent({@required this.idProvinces});
  @override
  List<Object> get props => [idProvinces];
}

class BackToLoginButtonEvent extends SignupEvent {
  final BuildContext context;
  BackToLoginButtonEvent({@required this.context});
  @override
  List<Object> get props => [context];
}

class ShowPassEvent extends SignupEvent {
  final bool showPass;
  ShowPassEvent({@required this.showPass});
  @override
  List<Object> get props => [showPass];
}

class ShowRePassEvent extends SignupEvent {
  final bool showRePass;
  ShowRePassEvent({@required this.showRePass});
  @override
  List<Object> get props => [showRePass];
}