import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/common/share.dart';
import 'package:status/common/toast.dart';

class ApplyPage extends StatefulWidget {
  const ApplyPage({Key? key}) : super(key: key);

  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
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
      // navigatePage(context, className: Login());
    }
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
          "Influenca",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: v16 * 2),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(v16),
                      child: Text(
                        "Would like to earn money by posting on your WhatsApp status?",
                        style: titleTextStyle.copyWith(
                            fontWeight: FontWeight.w600, color: APP_ACCENT),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: v16 * 2, right: v16 * 2, top: v16 * 1.4),
                      child: normalButton(
                          v16: v16 * 1, bgColor: APP_ACCENT, title: "Next"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: v16 * 2),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(v16),
                      child: Text(
                        "Share the following image to your status ",
                        style: titleTextStyle.copyWith(
                            fontWeight: FontWeight.w600, color: APP_ACCENT),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showToast("Loading", context);
                        shareImageFromUrl(
                            appName: "Tunda Status",
                            onError: (e) => showErrorToast("Error $e", context),
                            url: testImage,
                            caption: "Tunda Status");
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: v16 * 2, right: v16 * 2, top: v16 * 1.4),
                        child: normalButton(
                            v16: v16 * 1, bgColor: APP_PRIMARY, title: "Share"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: v16 * 2, right: v16 * 2, top: v16 * 1.4),
                      child: normalButton(
                          v16: v16 * 1, bgColor: APP_ACCENT, title: "Next"),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
