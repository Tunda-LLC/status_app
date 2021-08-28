import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:status/common/colors.dart';
import 'package:status/controllers/projectController.dart';
import 'package:status/influenca/gig/gig.dart';
import 'package:status/influenca/widgets/gig_tile.dart';
import 'package:status/influenca/widgets/image_tiles.dart';
import 'package:status/main.dart';
import 'package:status/models/project.dart';
import 'package:status/pages/client_project.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> with AutomaticKeepAliveClientMixin {
  late String id;
  // List<Project> projects = [];
  late Future<List<Project>> _history;
  late String myId;
  @override
  void initState() {
    super.initState();
    var box = Hive.box(UserBox);
    myId = box.get("id");
    _history = fetchHistory(myId: myId);
    User user = FirebaseAuth.instance.currentUser!;
    id = user.uid;
  }

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
        child: FutureBuilder<List<Project>>(
          future: _history,
          builder: (context, AsyncSnapshot<List<Project>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              _history = fetchHistory(myId: myId);
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
                child: Text("No history yet"),
              ));
            }

            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ProjectTile(
                      url: snapshot.data![index].mediaFileUrl,
                      title: snapshot.data![index].name,
                      id: snapshot.data![index].id,
                      isComplete: snapshot.data![index].isDone,
                      project: snapshot.data![index],
                      width: width,
                      v16: v16);
                });
          },
        ),
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
      required this.id,
      required this.isComplete,
      required this.project,
      this.isClient = true,
      this.isVerified = false,
      required this.v16})
      : super(key: key);
  double v16, width;
  String url, title, id;
  Project project;
  bool isComplete, isClient, isVerified;
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
      onTap: () => navigatePage(context,
          className: widget.isClient
              ? ClientProject(
                  project: widget.project,
                )
              : Gig(
                  project: widget.project,
                )),
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
                  widget.isClient
                      ? widget.isComplete
                          ? complete()
                          : ongoing()
                      : Container()
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

  pending() {
    return tag("Pending", APP_RED);
  }

  verified() {
    return tag("Verified", APP_ACCENT);
  }
}
