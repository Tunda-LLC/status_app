import 'package:flutter/material.dart';

class Qaz extends StatefulWidget {
  const Qaz({Key? key}) : super(key: key);

  @override
  _QazState createState() => _QazState();
}

class _QazState extends State<Qaz> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    double v32 = v16 / 2;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: ListView(children: <Widget>[
          //
        ]),
      ),
    );
  }
}
