import 'package:firstapp_bloc_api/blocs/loginBloc/bloc.dart';
import 'package:firstapp_bloc_api/configs/configs.dart';
import 'package:firstapp_bloc_api/streams/loginstream/loginStream.dart';
import 'package:firstapp_bloc_api/styles/styles.dart';
import 'package:firstapp_bloc_api/utils/utils.dart';
import 'package:firstapp_bloc_api/widgets/dialogs/loadingWidget.dart';
import 'package:firstapp_bloc_api/widgets/dialogs/showMessageDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userController =
      new TextEditingController(text: ConfigsApp.isDebugMode ? "admin" : "");
  TextEditingController _passController =
      new TextEditingController(text: ConfigsApp.isDebugMode ? "admin" : "");
  final FocusNode _userName = FocusNode();
  final FocusNode _passWord = FocusNode();
  LoginStream loginStream;
  bool secureText;

  @override
  void initState() {
    loginStream = LoginStream();
    secureText = true;
    super.initState();
  }

  @override
  void dispose() {
    loginStream.dispose();
    super.dispose();
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    Dimension.height = MediaQuery.of(context).size.height;
    Dimension.witdh = MediaQuery.of(context).size.width;
    SizeText.queryData = MediaQuery.of(context).textScaleFactor;
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailureState) {
            MessageDialog.showMsgDialog(
                context: context,
                title: "Thông báo",
                filenameError: state.error,
                desc: state.fieldName ?? "",
                alertTtyle: state.alertType);
          } else 
          if (state is ShowPassState) {
            secureText = state.showPass;
          } else if (state is LoginLoadingState) {
            LoadingWidget();
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
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
                          ImagePath.cover,
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
                        stream: loginStream.userStream,
                        builder: (context, snapshot) => TextField(
                          focusNode: _userName,
                          controller: _userController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          onSubmitted: (va) {
                            _fieldFocusChange(context, _userName, _passWord);
                          },
                          decoration: InputDecoration(
                              errorStyle: StylesText.content17_62,
                              hintStyle: StylesText.content18Black,
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              labelText: "Tài khoản",
                              hasFloatingPlaceholder: true),
                          onChanged: (va) {
                            loginStream.userNameChange(va);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          StreamBuilder(
                            stream: loginStream.passStream,
                            builder: (context, snapshot) => TextField(
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              controller: _passController,
                              obscureText: secureText,
                              decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                errorStyle: StylesText.content17_62,
                                hintStyle: StylesText.content17Black,
                                labelText: "Mật khẩu",
                                hasFloatingPlaceholder: true,
                                suffix: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<LoginBloc>(context).add(
                                        ShowPassButtonPressedEvent(
                                            showPass: secureText));
                                  },
                                  child: Text(secureText ? "Hiện" : "Ẩn",
                                      style: StylesText.content14_161),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: RaisedButton(
                          onPressed: () async {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonPressedEvent(
                                  context: context,
                                  id: _userController.text,
                                  password: _passController.text,
                                  loginStream: loginStream),
                            );
                          },
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: RaisedButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(
                                RegisterButtonPressedEvent(context: context));
                          },
                          color: Colors.black12,
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
}
