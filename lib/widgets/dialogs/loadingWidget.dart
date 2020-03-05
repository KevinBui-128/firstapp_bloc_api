import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firstapp_bloc_api/styles/styles.dart';
import 'package:firstapp_bloc_api/utils/utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.getHeight(1.0),
      width: Dimension.getWidth(1.0),
      color: Colors.black38,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          height: Dimension.getHeight(0.15),
          child: Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: new SpinKitFadingCircle(
                    color: Color.fromARGB(255, 40, 115, 161),
                    size: 50,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    "Đang tải...",
                    style: StylesText.header20black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
