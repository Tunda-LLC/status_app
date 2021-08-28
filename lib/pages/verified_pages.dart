import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:status/common/colors.dart';
import 'package:status/controllers/projectController.dart';
import 'package:status/influenca/widgets/image_tiles.dart';
import 'package:status/main.dart';
import 'package:status/models/project.dart';
import 'package:status/models/screenshot.dart';

class VerifyProject extends StatefulWidget {
  VerifyProject({Key? key, required this.project}) : super(key: key);
  final Project project;
  @override
  _VerifyProjectState createState() => _VerifyProjectState();
}

class _VerifyProjectState extends State<VerifyProject>
    with AutomaticKeepAliveClientMixin {
  late String myId;
  late Future<List<Screenshot>> _screens;

  @override
  void initState() {
    super.initState();
    var box = Hive.box(UserBox);
    myId = box.get("id");
    _screens = fetchScreenshots(myId, widget.project.id);
  }

  List<Widget> _dataScreenshotImages({required List<Screenshot> imageList}) {
    List<Widget> children = List.empty(growable: true);

    for (var item in imageList) {
      children.add(
        Stack(
          children: [
            Positioned.fill(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CupertinoActivityIndicator()],
                )
              ],
            )),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(item.media),
              ),
            ),
          ],
        ),
      );
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        child: FutureBuilder<List<Screenshot>>(
          future: _screens,
          builder: (context, AsyncSnapshot<List<Screenshot>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              _screens = fetchScreenshots(myId, widget.project.id);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Padding(
                padding: EdgeInsets.all(v16),
                child: CupertinoActivityIndicator(),
              ));
            }

            if (snapshot.data == null || snapshot.data?.length == 0) {
              return Center(
                  child: Padding(
                padding: EdgeInsets.all(v16),
                child: Text("No screenshots yet"),
              ));
            }
            var num = snapshot.data?.length;

            return ImageSlide(
                width: width,
                showButtons: false,
                v16: v16,
                imagesLength: num!,
                timerDuration: 12,
                images: _dataScreenshotImages(imageList: snapshot.data!),
                height: height);
          },
        ),
      ),
      // ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
