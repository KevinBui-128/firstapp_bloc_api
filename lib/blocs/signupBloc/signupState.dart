import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

abstract class SignupState extends Equatable {
  const SignupState();
  @override
  List<Object> get props => [];
}

class InitialSignupState extends SignupState {}

class FetchDataSignUpState extends SignupState {}

class SignUpFaileValidationState extends SignupState {}

class SignUpLoadingState extends SignupState {}

class ChangeDropdowListState extends SignupState {}

class SignUpSuccessState extends SignupState {}

class SignUpFailureState extends SignupState {
  final int errorCode;
  final String error;
  final String fieldName;
  final AlertType alertType;
  const SignUpFailureState(
      {@required this.error,
        @required this.errorCode,
        @required this.fieldName,
        @required this.alertType});
  @override
  List<Object> get props => [errorCode, error, alertType];
  @override
  String toString() => 'SignUpFailure {errorCode:$errorCode ,error: $error }';
}

class BackToLoginState extends SignupState {}

class ShowPassState extends SignupState {
  final bool showPass;
  ShowPassState({@required this.showPass});
  @override
  List<Object> get props => [showPass];
}

class ShowRePassState extends SignupState {
  final bool showRePass;
  ShowRePassState({@required this.showRePass});
  @override
  List<Object> get props => [showRePass];
}

class DatePickerState extends SignupState {
  final String date;
  DatePickerState({@required this.date});
  @override
  List<Object> get props => [date];
}