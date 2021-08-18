import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/intro/intro.dart';
import 'package:status/intro/intro2.dart';
import 'package:status/intro/intro3.dart';
import 'package:status/pages/index.dart';

class IntroIndex extends StatefulWidget {
  const IntroIndex({Key? key}) : super(key: key);

  @override
  _IntroIndexState createState() => _IntroIndexState();
}

class _IntroIndexState extends State<IntroIndex> {
  PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;
  int _totalPages = 3;

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

  onNext() {
    if (!(pageIndex == (_totalPages - 1))) {
      pageIndex++;
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        //code will run when widget rendering complete
        pageController.animateToPage(
          pageIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    } else {
      navigatePage(context, className: Index());
    }
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
        body: Container(
          width: width,
          height: height,
          child: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: <Widget>[
                IntroPage(
                  onTap: () => onNext(),
                ),
                IntroPage2(
                  onTap: () => onNext(),
                ),
                IntroPage3(
                  onTap: () => onNext(),
                )
              ]),
        ),
      ),
    );
  }
}
