import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/common/toast.dart';
import 'package:status/pages/influencer/views/widgets/image_tiles.dart';

class Gig extends StatefulWidget {
  const Gig({Key? key}) : super(key: key);

  @override
  _GigState createState() => _GigState();
}

class _GigState extends State<Gig> {
  String caption = "Loremjfvjfjf  fdjdfjdfj jfdjdfjdfj jdfjdfjdfjdfj jvjdfjdfj";
  bool _show = false;
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
          "Kattoke's ads",
          style: titleTextStyle,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView(
          children: <Widget>[
            ImageSlide(
                width: width,
                showButtons: _show,
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
            Container(
              padding: EdgeInsets.only(
                  left: v16 / 2,
                  right: v16 / 2,
                  bottom: v16 / 3,
                  top: v16 / 1.4),
              child: Text(
                caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: normalTextStyle.copyWith(color: APP_GREY),
              ),
            ),
            Visibility(
              visible: _show,
              child: InkWell(
                onTap: () {
                  ClipboardManager.copyToClipBoard(caption).then((result) {
                    showToast("Text copied to clipBoard", context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 8,
                    left: v16 / 2,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.copy,
                        color: APP_BLACK,
                      ),
                      Text(
                        "Copy",
                        style: normalTextStyle.copyWith(color: APP_BLACK),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // BUTTON
            Container(
                margin: EdgeInsets.only(
                    left: v16 / 2, right: v16 / 2, bottom: v16 / 2),
                child: normalButton(
                    v16: v16 / 1.6, bgColor: APP_BLACK, title: "Accept Gig")),
          ],
        ),
      ),
    );
  }
}
