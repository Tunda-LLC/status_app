import 'package:flutter/material.dart';

import 'common/colors.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key, required this.onTap}) : super(key: key);
  var onTap;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    double v32 = v16 / 2;
    return Scaffold(
      backgroundColor: REAL_BLACK,
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              "assets/intro/intro1.jpg",
              fit: BoxFit.cover,
            )),
            Positioned.fill(
                child: Container(
              color: REAL_BLACK.withOpacity(0.4),
            )),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "tunda\nstatus",
                          textAlign: TextAlign.center,
                          style: titleTextStyle.copyWith(
                              color: Color(0xffC3E3F2),
                              fontSize: 48,
                              letterSpacing: 2,
                              fontFamily: "Network"),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 8, left: v16, right: v16),
                          child: Text(
                            "A Tunda LLC Application",
                            textAlign: TextAlign.center,
                            style: titleTextStyle.copyWith(
                                color: Color(0xff000000)),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: v16 * 3, right: v16 * 3, top: v16 * 3),
                      child: normalButton(
                          v16: v16, bgColor: APP_ACCENT, title: "Next"),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
