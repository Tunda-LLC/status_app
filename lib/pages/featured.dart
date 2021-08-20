import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:status/common/colors.dart';
import 'package:status/influenca/widgets/image_tiles.dart';
import 'package:status/models/project.dart';
import 'package:transparent_image/transparent_image.dart';

class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured>
    with AutomaticKeepAliveClientMixin {
  List<Project> projects = [];
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
          "Featured",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(children: <Widget>[
          Container(
            height: height,
            child: StreamBuilder(
                stream: FirebaseDatabase.instance
                    .reference()
                    .child("projects")
                    .orderByChild("is_done")
                    .equalTo(true)
                    .onValue,
                builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("Nothing yet :("),
                    );
                  }

                  Map<dynamic, dynamic> map = snapshot.data!.snapshot.value;

                  projects.clear();

                  map.forEach((dynamic, v) => projects.add(new Project(
                        title: v["title"],
                        caption: v["caption"],
                        url: v["media"],
                        is_done: v['is_done'],
                        clientId: v["client_id"],
                      )));
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: projects.length,
                    padding: EdgeInsets.only(
                        left: 4, right: 4, top: v16, bottom: height / 3),
                    itemBuilder: (BuildContext context, int index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: APP_GREY,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CustomNetworkImage(projects[index].url,
                              cover: true),
                        )),
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 3 : 2),
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  );
                }),
          ),
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
