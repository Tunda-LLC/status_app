import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/influenca/widgets/gig_tile.dart';
import 'package:status/influenca/widgets/image_tiles.dart';
import 'package:status/pages/client_project.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    double v32 = v16 / 2;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: REAL_WHITE,
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Recent",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(children: <Widget>[
          //
          ProjectTile(
              url: testImage,
              title: "Ads only",
              isComplete: true,
              width: width,
              v16: v16),
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProjectTile extends StatefulWidget {
  ProjectTile(
      {Key? key,
      required this.url,
      required this.title,
      required this.width,
      required this.isComplete,
      required this.v16})
      : super(key: key);
  double v16, width;
  String url, title;
  bool isComplete;
  @override
  _ProjectTileState createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  late double sideLength;
  @override
  void initState() {
    super.initState();
    sideLength = widget.width / 3;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigatePage(context, className: ClientProject()),
      child: Container(
        padding: EdgeInsets.only(
          left: widget.v16,
          right: widget.v16,
          top: widget.v16 / 2,
          bottom: widget.v16 / 2,
        ),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: SHIMMER_DARK, width: 0.8))),
        child: Row(
          children: [
            Container(
              width: widget.width * 0.24,
              height: widget.width * 0.24,
              padding: EdgeInsets.only(right: widget.v16 / 2),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomNetworkImage(widget.url, cover: true)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleTextStyle,
                    ),
                  ),
                  widget.isComplete ? complete() : ongoing()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  tag(String text, Color color) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 1.4)),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        text,
        style: normalTextStyle.copyWith(color: color),
      ),
    );
  }

  complete() {
    return tag("Complete", APP_ACCENT);
  }

  ongoing() {
    return tag("Ongoing", APP_PRIMARY);
  }
}
