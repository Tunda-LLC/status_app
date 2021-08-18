import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';

import 'gig.dart';

class RunningPageV3 extends StatefulWidget {
  const RunningPageV3({Key? key}) : super(key: key);

  @override
  _RunningPageV3State createState() => _RunningPageV3State();
}

class _RunningPageV3State extends State<RunningPageV3> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: REAL_WHITE,
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Running",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(padding: EdgeInsets.all(v16), children: <Widget>[
          //
          GigTile(v16: v16),
        ]),
      ),
    );
  }
}
