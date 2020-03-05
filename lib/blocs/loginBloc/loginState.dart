import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginFaileValidationState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final int errorCode;
  final String error;
  final String fieldName;
  final AlertType alertType;
  const LoginFailureState(
      {@required this.error,
        @required this.errorCode,
        @required this.fieldName,
        @required this.alertType});
  @override
  List<Object> get props => [errorCode, error, alertType];
  @override
  String toString() => 'LoginFailure {errorCode:$errorCode ,error: $error }';
}

//class RegisterButtonPressedEvent extends LoginState{}

class ChangeToSignupState extends LoginState {}

class ShowPassState extends LoginState {
  final bool showPass;
  ShowPassState({@required this.showPass});
  @override
  List<Object> get props => [showPass];
}
