import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/common/share.dart';
import 'package:status/common/toast.dart';
import 'package:status/influenca/widgets/image_tiles.dart';

class Gig extends StatefulWidget {
  const Gig({Key? key}) : super(key: key);

  @override
  _GigState createState() => _GigState();
}

class _GigState extends State<Gig> {
  String caption = "Loremjfvjfjf  fdjdfjdfj jfdjdfjdfj jdfjdfjdfjdfj jvjdfjdfj";
  bool _show = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          "Kattoke's ads",
          style: titleTextStyle,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView(
          padding: EdgeInsets.only(top: v16),
          children: <Widget>[
            Container(
                height: height / 2.5,
                width: width - (4 * v16),
                child: Center(child: CustomNetworkImage(testImage))),
            // CAPTION
            Container(
              padding: EdgeInsets.only(
                  left: v16, right: v16, bottom: v16 * 2, top: v16 * 2),
              child: Text(
                caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: titleTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ),

            // BUTTON
            InkWell(
              onTap: () {
                showToast("Loading", context);
                shareImageFromUrl(
                    appName: "Tunda Status",
                    onError: (e) => showErrorToast("Error $e", context),
                    url: testImage,
                    caption: caption);
              },
              child: Container(
                  margin: EdgeInsets.only(left: v16, right: v16, bottom: v16),
                  child: normalButton(
                      v16: v16, bgColor: APP_BLACK, title: "Post")),
            ),
          ],
        ),
      ),
    );
  }
}
