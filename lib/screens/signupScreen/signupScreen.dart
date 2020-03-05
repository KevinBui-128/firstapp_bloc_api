import 'package:firstapp_bloc_api/blocs/signupBloc/bloc.dart';
import 'package:firstapp_bloc_api/streams/signupStream/signupStream.dart';
import 'package:firstapp_bloc_api/styles/styles.dart';
import 'package:firstapp_bloc_api/utils/utils.dart';
import 'package:firstapp_bloc_api/widgets/dialogs/loadingWidget.dart';
import 'package:firstapp_bloc_api/widgets/dialogs/showMessageDialog.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  TextEditingController _userController;
  TextEditingController _passController;

  SignUpStream signUpStream;
  bool secureTextPass;

  @override
  void initState() {
    secureTextPass = true;
    _userController = new TextEditingController();
    _passController = new TextEditingController();
    signUpStream = SignUpStream();
    super.initState();
  }

  @override
  void dispose() {
    signUpStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc()..add(FetchDataEvent()),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) async {
          if (state is SignUpFailureState) {
            MessageDialog.showMsgDialog(
                context: context,
                title: "Thông báo lỗi" + " " + state.errorCode.toString(),
                filenameError: state.fieldName,
                desc: state.error,
                alertTtyle: state.alertType);
          } else if (state is ShowPassState) {
            secureTextPass = state.showPass;
          } else if (state is SignUpLoadingState) {
            LoadingWidget();
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            return Scaffold(
              body: Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      // child: ClipPath(
                      // clipper: MyClipper(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          ImagePath.cover2,
                          alignment: Alignment.center,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Divider(
                      color: Color.fromARGB(255, 40, 115, 161),
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: StreamBuilder(
                        stream: signUpStream.userStream,
                        builder: (context, snapshot) => TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          controller: _userController,
                          autocorrect: true,
                          enableSuggestions: true,
                          onChanged: (va) {
                            signUpStream.userNameChange(va);
                          },
                          decoration: InputDecoration(
                              errorStyle: StylesText.content17_62,
                              hintStyle: StylesText.content17Black,
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              labelText: "Tài khoản",
                              // labelStyle:StylesText.content17_161,
                              hasFloatingPlaceholder: true),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          StreamBuilder(
                            stream: signUpStream.passStream,
                            builder: (context, snapshot) => TextField(
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              controller: _passController,
                              obscureText: secureTextPass,
                              decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                errorStyle: StylesText.content17_62,
                                hintStyle: StylesText.content17Black,
                                labelText: "Mật khẩu",
                                hasFloatingPlaceholder: true,
                                suffix: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<SignupBloc>(context).add(
                                        ShowPassEvent(
                                            showPass: secureTextPass));
                                  },
                                  child: Text(secureTextPass ? "Hiện" : "Ẩn",
                                      style: StylesText.content14_161),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: RaisedButton(
                          onPressed: () async {
                            await _onPressSignUp(context);
                          },
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future _onPressSignUp(BuildContext context) async {
    BlocProvider.of<SignupBloc>(context).add(
      RegisterButtonPressedEvent(
        userName: _userController.text.trim(),
        password: _passController.text.trim(),
        signUpStream: signUpStream,
        platform: Platform.operatingSystem.toString(),
        context: context,
      ),
    );
  }
}
