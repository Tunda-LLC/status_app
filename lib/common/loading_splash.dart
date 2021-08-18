import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';

class LoadingSplash extends StatefulWidget {
  const LoadingSplash({Key? key}) : super(key: key);

  @override
  _LoadingSplashState createState() => _LoadingSplashState();
}

class _LoadingSplashState extends State<LoadingSplash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: REAL_BLACK,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/splash.png",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "tunda\nstatus",
                    textAlign: TextAlign.center,
                    style: titleTextStyle.copyWith(
                        color: REAL_WHITE,
                        fontSize: 48,
                        letterSpacing: 2,
                        fontFamily: "Network"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16 * 2),
                  child: CupertinoActivityIndicator(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
