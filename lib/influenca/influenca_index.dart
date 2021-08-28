import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'earnings.dart';
import 'home.dart';
import 'my_gigs.dart';

class InfluencerIndex extends StatefulWidget {
  @override
  _InfluencerIndexState createState() => _InfluencerIndexState();
}

class _InfluencerIndexState extends State<InfluencerIndex> {
  late PageController pageController;
  int pageIndex = 1;
  final indexKey = new GlobalKey<ScaffoldState>();
  late String myId;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pageIndex);
  }

  onPageChanged(int index) {
    setState(() {
      this.pageIndex = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    return Scaffold(
      key: indexKey,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: REAL_WHITE,
        elevation: 4,
        showSelectedLabels: false,
        selectedItemColor: APP_ACCENT,
        unselectedItemColor: APP_GREY.withAlpha(90),
        currentIndex: pageIndex,
        onTap: (index) {
          FocusScope.of(context).requestFocus(new FocusNode());

          pageController.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.gridOutline,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.homeOutline), label: "Home"),
          // BottomNavigationBarItem(
          //     icon: Icon(EvaIcons.pieChartOutline), label: "Home"),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        child: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            //
            MyGigs(),
            InfluencaHome(),
            // Earnings(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: REAL_WHITE,
        child: Icon(
          Icons.refresh_outlined,
          color: APP_ACCENT,
        ),
        onPressed: () => navigatePage(context, className: InfluencerIndex()),
      ),
    );
  }
}
