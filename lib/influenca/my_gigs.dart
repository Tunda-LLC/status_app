import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/pages/history.dart';

class MyGigs extends StatefulWidget {
  MyGigs({Key? key}) : super(key: key);

  @override
  _MyGigsState createState() => _MyGigsState();
}

class _MyGigsState extends State<MyGigs> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          "My Gigs",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
          width: width,
          height: height,
          child: ListView(
              padding:
                  EdgeInsets.only(bottom: v16, left: v16 / 2, right: v16 / 2),
              children: <Widget>[
                //
                ProjectTile(
                    url: testImage,
                    title: "Katooke ads",
                    isComplete: true,
                    isClient: false,
                    width: width,
                    v16: v16),
                ProjectTile(
                    url: testImage,
                    title: "Tunda ads",
                    isComplete: false,
                    isClient: false,
                    isVerified: false,
                    width: width,
                    v16: v16),
                ProjectTile(
                    url: testImage2,
                    title: "Tunda Status",
                    isComplete: false,
                    isClient: false,
                    isVerified: true,
                    width: width,
                    v16: v16),
              ])),
    );
  }
}
