import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:status/common/colors.dart';
import 'package:status/controllers/projectController.dart';
import 'package:status/main.dart';
import 'package:status/models/project.dart';
import 'package:status/pages/history.dart';

class MyGigs extends StatefulWidget {
  MyGigs({Key? key}) : super(key: key);

  @override
  _MyGigsState createState() => _MyGigsState();
}

class _MyGigsState extends State<MyGigs> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late String myId;
  late Future<List<Project>> _myGigs;

  @override
  void initState() {
    var box = Hive.box(UserBox);
    myId = box.get("id");
    _myGigs = fetchAcceptedGigs(myId: myId);
    super.initState();
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
        centerTitle: true,
        elevation: 2,
        title: Text(
          "My Gigs",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: FutureBuilder<List<Project>>(
          future: _myGigs,
          builder: (context, AsyncSnapshot<List<Project>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              _myGigs = fetchAcceptedGigs(myId: myId);
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
                padding:
                    EdgeInsets.only(bottom: v16, left: v16 / 2, right: v16 / 2),
                itemCount: snapshot.data?.length,
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
