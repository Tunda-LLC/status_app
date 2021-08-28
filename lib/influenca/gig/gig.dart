import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:status/common/colors.dart';
import 'package:status/common/share.dart';
import 'package:status/common/toast.dart';
import 'package:status/controllers/projectController.dart';
import 'package:status/influenca/widgets/image_tiles.dart';
import 'package:status/main.dart';
import 'package:status/models/project.dart';

class Gig extends StatefulWidget {
  const Gig({Key? key, required this.project}) : super(key: key);
  final Project project;
  @override
  _GigState createState() => _GigState();
}

class _GigState extends State<Gig> with AutomaticKeepAliveClientMixin {
  late String myId;
  @override
  void initState() {
    super.initState();
    var box = Hive.box(UserBox);
    myId = box.get("id");
  }

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
          widget.project.name,
          style: titleTextStyle,
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView(
          padding: EdgeInsets.only(top: v16),
          children: <Widget>[
            // Container(
            //     height: height / 2.5,
            //     width: width - (4 * v16),
            //     child: Center(child: CustomNetworkImage(testImage))),
            Container(
              padding: EdgeInsets.only(left: v16, right: v16, top: v16 * 2),
              child: Text(
                "Press the Post button to post",
                style: titleTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            // CAPTION
            Container(
              padding: EdgeInsets.only(
                  left: v16, right: v16, bottom: v16 * 2, top: v16),
              child: Text(
                widget.project.caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: normalTextStyle.copyWith(
                    fontWeight: FontWeight.w500, color: APP_PRIMARY),
              ),
            ),

            // BUTTON
            InkWell(
              onTap: () async {
                showToast("Loading please wait...", context);

                shareImageFromUrl(
                    appName: "Tunda Status",
                    onError: (e) => showErrorToast("Error $e", context),
                    url: widget.project.mediaFileUrl,
                    caption: widget.project.caption);
                await acceptGig(myId: myId, projectId: widget.project.id);
                showToast("check my gigs to verify", context);
              },
              child: Container(
                  margin: EdgeInsets.only(left: v16, right: v16, bottom: v16),
                  child: normalButton(
                      v16: v16, bgColor: APP_BLACK, title: "Post")),
            ),

            Container(
              padding: EdgeInsets.only(left: v16, right: v16, top: v16),
              child: Text(
                "Press the Verify button to submit screenshot of the post after some time",
                style: titleTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ),

            // BUTTON
            InkWell(
              onTap: () {
                //todo Verify
              },
              child: Container(
                  margin: EdgeInsets.only(left: v16, right: v16, bottom: v16),
                  child: normalButton(
                      v16: v16, bgColor: APP_PRIMARY, title: "Verify")),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
