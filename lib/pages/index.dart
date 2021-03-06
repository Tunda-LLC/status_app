import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/pages/featured.dart';
import 'package:status/pages/history.dart';

import 'home.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int pageIndex = 1;
  PageController pageController = PageController(initialPage: 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int index) {
    setState(() {
      this.pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    double v32 = v16 / 2;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                  EvaIcons.compassOutline,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.homeOutline), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history_outlined,
                ),
                label: "Home"),
          ],
        ),
        body: Container(
          width: width,
          height: height,
          child: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[Featured(), HomePage(), History()]),
        ),
      ),
    );
  }
}
