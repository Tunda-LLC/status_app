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
    double width = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: height,
        width: width,
      ),
    );
  }
}
