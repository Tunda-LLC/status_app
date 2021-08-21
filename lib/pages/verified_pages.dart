import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/influenca/widgets/image_tiles.dart';

class VerifyProject extends StatefulWidget {
  VerifyProject({Key? key}) : super(key: key);

  @override
  _VerifyProjectState createState() => _VerifyProjectState();
}

class _VerifyProjectState extends State<VerifyProject> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: REAL_WHITE,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: APP_BLACK,
            size: 24,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Screenshots",
          style: titleTextStyle,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference()
              .child("projects")
              .orderByChild("client_id")
              .equalTo(id)
              .onValue,
          child: ListView(
            children: <Widget>[
              ImageSlide(
                  width: width,
                  showButtons: false,
                  v16: v16,
                  imagesLength: 3,
                  timerDuration: 12,
                  images: <Widget>[
                    CustomNetworkImage(testImage1),
                    CustomNetworkImage(testImage),
                    CustomNetworkImage(testImage2),
                  ],
                  height: height),
              // CAPTION
            ],
          ),
        ),
      ),
    );
  }
}
