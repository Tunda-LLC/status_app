import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';

import 'verify_gig.dart';
import 'widgets/gig_tile.dart';

class MyGigs extends StatefulWidget {
  const MyGigs({Key? key}) : super(key: key);

  @override
  _MyGigsState createState() => _MyGigsState();
}

class _MyGigsState extends State<MyGigs> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: REAL_WHITE,
          bottom: TabBar(
            labelColor: APP_BLACK,
            unselectedLabelColor: APP_GREY,
            indicatorColor: APP_BLACK,
            tabs: [
              Tab(text: "Accepted"),
              Tab(text: "Pending"),
              Tab(text: "Verified"),
            ],
          ),
          title: Text(
            'My Gigs',
            style: titleTextStyle.copyWith(color: APP_BLACK),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          child: TabBarView(
            children: [
              ListView(
                children: <Widget>[
                  GigTile(
                    v16: v16,
                    status: 1,
                  ),
                  GigTile(
                    v16: v16,
                    status: 2,
                  ),
                  GigTile(
                    v16: v16,
                    status: 3,
                  ),
                  GigTile(v16: v16),
                  GigTile(v16: v16),
                ],
              ),
              InkWell(
                  onTap: () => navigatePage(context, className: VerifyGig()),
                  child: Icon(Icons.directions_transit)),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
