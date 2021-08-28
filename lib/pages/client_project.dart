// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/influenca/widgets/image_tiles.dart';
import 'package:status/models/project.dart';
import 'package:status/pages/verified_pages.dart';

class ClientProject extends StatefulWidget {
  const ClientProject({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  _ClientProjectState createState() => _ClientProjectState();
}

class _ClientProjectState extends State<ClientProject> {
  // late String views, influencas, url, title, caption;
  @override
  void initState() {
    super.initState();
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
            padding:
                EdgeInsets.only(top: v16, left: v16, right: v16, bottom: v16),
            children: <Widget>[
              //
              Container(
                padding: EdgeInsets.only(bottom: v16, top: v16),
                child: Text(
                  widget.project.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleTextStyle.copyWith(
                      fontWeight: FontWeight.w500, color: APP_ACCENT),
                ),
              ),

              // Container(
              //   padding: EdgeInsets.only(bottom: v16),
              //   child: Row(
              //     children: [
              //       Text(
              //         "Views so far:",
              //         style: titleTextStyle.copyWith(
              //             fontWeight: FontWeight.w500, color: APP_ACCENT),
              //       ),
              //       Expanded(
              //         child: Container(
              //           padding: EdgeInsets.only(left: 8),
              //           child: Text(
              //             views,
              //             style: titleTextStyle.copyWith(
              //                 fontWeight: FontWeight.w500, color: APP_ACCENT),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // Container(
              //   padding: EdgeInsets.only(bottom: v16),
              //   child: Row(
              //     children: [
              //       Text(
              //         "Influencers so far:",
              //         style: titleTextStyle.copyWith(
              //             fontWeight: FontWeight.w500, color: APP_ACCENT),
              //       ),
              //       Expanded(
              //         child: Container(
              //           padding: EdgeInsets.only(left: 8),
              //           child: Text(
              //             influencas,
              //             style: titleTextStyle.copyWith(
              //                 fontWeight: FontWeight.w500, color: APP_ACCENT),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Container(
                padding: EdgeInsets.only(bottom: v16, top: v16),
                child: Text(
                  widget.project.caption,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: normalTextStyle.copyWith(
                      fontWeight: FontWeight.w500, color: APP_PRIMARY),
                ),
              ),

              InkWell(
                onTap: () => navigatePage(context,
                    className: VerifyProject(project: widget.project)),
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
                height: height / 1.5,
                decoration: BoxDecoration(
                  color: SHIMMER_DARK,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
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
                        child: Image.network(widget.project.mediaFileUrl),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
