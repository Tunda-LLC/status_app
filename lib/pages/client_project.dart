import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/influenca/widgets/image_tiles.dart';
import 'package:status/pages/verified_pages.dart';

class ClientProject extends StatefulWidget {
  const ClientProject({Key? key, required this.projectId}) : super(key: key);
  final String projectId;

  @override
  _ClientProjectState createState() => _ClientProjectState();
}

class _ClientProjectState extends State<ClientProject> {
  late String views, influencas, url, title, caption;
  final dbRef = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    dbRef
        .child("started_projects")
        .child(widget.projectId)
        .once()
        .then((DataSnapshot snapshot) {
      influencas = snapshot.value['influencas_used'];
      views = snapshot.value['views_covered'];
      print('Data : ${snapshot.value}');
    });

    dbRef
        .child("projects")
        .child(widget.projectId)
        .once()
        .then((DataSnapshot snapshot) {
      title = snapshot.value['title'];
      caption = snapshot.value['caption'];
      url = snapshot.value['media'];
      print('Data : ${snapshot.value}');
    });
  }

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
          "Project",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(
            padding: EdgeInsets.only(
                top: v16 * 1, left: v16 * 2, right: v16 * 2, bottom: v16 * 2),
            children: <Widget>[
              //
              Container(
                padding: EdgeInsets.only(bottom: v16),
                child: Row(
                  children: [
                    Text(
                      "Title:",
                      style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w500, color: APP_ACCENT),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyle.copyWith(
                              fontWeight: FontWeight.w500, color: APP_ACCENT),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: v16),
                child: Row(
                  children: [
                    Text(
                      "Views so far:",
                      style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w500, color: APP_ACCENT),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          views,
                          style: titleTextStyle.copyWith(
                              fontWeight: FontWeight.w500, color: APP_ACCENT),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: v16),
                child: Row(
                  children: [
                    Text(
                      "Influencers so far:",
                      style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w500, color: APP_ACCENT),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          influencas,
                          style: titleTextStyle.copyWith(
                              fontWeight: FontWeight.w500, color: APP_ACCENT),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: v16),
                child: Row(
                  children: [
                    Text(
                      "Caption:",
                      style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w500, color: APP_ACCENT),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          caption,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyle.copyWith(
                              fontWeight: FontWeight.w500, color: APP_ACCENT),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () => navigatePage(context, className: VerifyProject()),
                child: Container(
                  margin: EdgeInsets.only(
                      left: v16 * 3,
                      right: v16 * 3,
                      top: v16 * 0.75,
                      bottom: v16),
                  child: normalButton(
                      v16: v16 * 1, bgColor: APP_ACCENT, title: "Screenshots"),
                ),
              ),

              Container(
                width: width - (4 * v16),
                decoration: BoxDecoration(
                  color: APP_GREY,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CustomNetworkImage(url)),
              ),
            ]),
      ),
    );
  }
}
