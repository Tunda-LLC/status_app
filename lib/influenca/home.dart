import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/controllers/projectController.dart';
import 'package:status/models/project.dart';
import 'package:status/pages/history.dart';

class InfluencaHome extends StatefulWidget {
  InfluencaHome({Key? key}) : super(key: key);

  @override
  _InfluencaHomeState createState() => _InfluencaHomeState();
}

class _InfluencaHomeState extends State<InfluencaHome>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late Future<List<Project>> _gigs;
  @override
  void initState() {
    super.initState();
    _gigs = fetchGigs();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: REAL_WHITE,
        leading: InkWell(
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
        child: FutureBuilder<List<Project>>(
          future: _gigs,
          builder: (context, AsyncSnapshot<List<Project>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              _gigs = fetchGigs();
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
                child: Text("No gigs yet"),
              ));
            }

            return ListView.builder(
                itemCount: snapshot.data?.length,
                padding:
                    EdgeInsets.only(bottom: v16, left: v16 / 2, right: v16 / 2),
                itemBuilder: (context, index) {
                  return ProjectTile(
                      url: snapshot.data![index].mediaFileUrl,
                      title: snapshot.data![index].name,
                      id: snapshot.data![index].id,
                      isComplete: snapshot.data![index].isDone,
                      project: snapshot.data![index],
                      isClient: false,
                      width: width,
                      v16: v16);
                });
          },
        ),
      ),
    );
  }
}
