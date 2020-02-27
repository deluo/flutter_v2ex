import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final bool ifShow;
  const Loading({Key key,@required this.ifShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Opacity(
            opacity: ifShow ? 0.9 : 0.0,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Color.fromRGBO(74, 74, 74, 0.8),
                borderRadius: BorderRadius.circular(6)
              ),
            ),
          )
        ),
        Center(
          child: Opacity(
            opacity: ifShow ? 0.9 : 0.0,
            child: SpinKitCircle(
              color: Color.fromRGBO(255, 255, 255, 0.9),
              size: 50.0,
            ),
          ),
        ),
      ],
    );
  }
}