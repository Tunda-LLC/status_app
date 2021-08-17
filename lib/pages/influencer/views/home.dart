import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';

import 'widgets/gig_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "#Influencer",
          style: titleTextStyle.copyWith(color: APP_BLACK),
        ),
        backgroundColor: REAL_WHITE,
      ),
      body: Container(
          width: width,
          height: height,
          child: ListView(
              padding: EdgeInsets.only(
                  top: 8, bottom: v16, left: v16 / 2, right: v16 / 2),
              children: <Widget>[
                //
                GigTile(v16: v16),
                GigTile(v16: v16),
                GigTile(v16: v16),
                GigTile(v16: v16),
                GigTile(v16: v16),
                GigTile(v16: v16),
                GigTile(v16: v16),
                GigTile(v16: v16),
                GigTile(v16: v16),
                GigTile(v16: v16),
              ])),
    );
  }
}
