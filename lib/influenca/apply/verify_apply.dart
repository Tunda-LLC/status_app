import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';

class VerifyApplyPage extends StatefulWidget {
  const VerifyApplyPage({Key? key}) : super(key: key);

  @override
  _VerifyApplyPageState createState() => _VerifyApplyPageState();
}

class _VerifyApplyPageState extends State<VerifyApplyPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    double v32 = v16 / 2;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: REAL_WHITE,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: APP_ACCENT,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Influenca",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: v16 * 2),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(v16),
                  child: Text(
                    "Share the following image to your status ",
                    style: titleTextStyle.copyWith(
                        fontWeight: FontWeight.w600, color: APP_ACCENT),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: v16 * 2, right: v16 * 2, top: v16 * 1.4),
                    child: normalButton(
                        v16: v16 * 1,
                        bgColor: APP_PRIMARY,
                        title: "Cancel Application"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: v16 * 2, right: v16 * 2, top: v16 * 1.4),
                  child: normalButton(
                      v16: v16 * 1, bgColor: APP_ACCENT, title: "Verify"),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
