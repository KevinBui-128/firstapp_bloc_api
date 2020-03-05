import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:firstapp_bloc_api/streams/loginstream/loginStream.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressedEvent extends LoginEvent {
  final BuildContext context;
  final String id;
  final String password;
  final LoginStream loginStream;
  const LoginButtonPressedEvent({
    @required this.id,
    @required this.password,
    @required this.loginStream,
    @required this.context,
  });

  @override
  List<Object> get props => [id, password];

  @override
  String toString() =>
      'LoginButtonPressed { id: $id, password: $password }';
}

class RegisterButtonPressedEvent extends LoginEvent {
  final BuildContext context;
  RegisterButtonPressedEvent({@required this.context});
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Event Change To LoginButtonPressed';
}

class ShowPassButtonPressedEvent extends LoginEvent {
  final bool showPass;
  ShowPassButtonPressedEvent({@required this.showPass});
  @override
  List<Object> get props => [showPass];
  @override
  String toString() => 'Event Change To ShowPass';
}

class ChangeToForgetPassEvent extends LoginEvent {
  final BuildContext context;
  ChangeToForgetPassEvent({@required this.context});
  @override
  List<Object> get props => [];
}
