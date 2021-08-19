import 'package:flutter/material.dart';
import 'package:status/client/project_upload.dart';
import 'package:status/common/colors.dart';
import 'package:status/influenca/influenca_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    double v32 = v16 / 2;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: ListView(padding: EdgeInsets.only(bottom: v16 * 4), children: <
            Widget>[
          Container(
            width: width,
            height: height / 3.5,
            child: Stack(
              children: [
                Positioned.fill(
                    child: ClipRRect(
                  child: Image.asset(
                    "assets/intro/intro1.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned.fill(
                    child: Container(
                  color: REAL_BLACK.withOpacity(0.4),
                )),
                Center(
                  child: Text(
                    "tunda\nstatus",
                    textAlign: TextAlign.center,
                    style: titleTextStyle.copyWith(
                        color: Color(0xffC3E3F2),
                        fontSize: 48,
                        letterSpacing: 2,
                        fontFamily: "Network"),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width,
            height: height / 4,
            child: Stack(
              children: [
                InkWell(
                  onTap: () =>
                      navigatePage(context, className: ProjectUpload()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: v16 * 3,
                          right: v16 * 3,
                        ),
                        child: normalButton(
                            v16: v16 * 1.2,
                            bgColor: APP_ACCENT,
                            title: "New Project"),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    left: width / 4,
                    bottom: v16,
                    child: Image.asset(
                      "assets/click.png",
                      width: v16 * 3,
                      color: APP_PRIMARY,
                    )),
                Positioned(
                    right: width / 5,
                    top: v16,
                    child: Image.asset(
                      "assets/down.png",
                      width: v16 * 3,
                      color: APP_PRIMARY,
                    )),
              ],
            ),
          ),
          Container(
            width: width,
            height: height / 7,
            child: Stack(
              children: [
                Positioned.fill(
                    child: ClipRRect(
                  child: Image.asset(
                    "assets/intro/intro3.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned.fill(
                    child: Container(
                  color: REAL_BLACK.withOpacity(0.4),
                )),
                Center(
                  child: Text(
                    "prices",
                    textAlign: TextAlign.center,
                    style: titleTextStyle.copyWith(
                        color: Color(0xffC3E3F2),
                        fontSize: 40,
                        letterSpacing: 2,
                        fontFamily: "Network"),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: v16 * 3,
              right: v16 * 3,
            ),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: v16, bottom: v16),
                    child: priceTile(v16: v16, price: "2,000", views: "500")),
                Container(
                    margin: EdgeInsets.only(bottom: v16 * 2),
                    child: priceTile(v16: v16, price: "4,000", views: "1,000"))
              ],
            ),
          ),
          Container(
            width: width,
            height: height / 7,
            child: Stack(
              children: [
                Positioned.fill(
                    child: ClipRRect(
                  child: Image.asset(
                    "assets/intro/intro2.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned.fill(
                    child: Container(
                  color: REAL_BLACK.withOpacity(0.4),
                )),
                Center(
                  child: Text(
                    "influenca side",
                    textAlign: TextAlign.center,
                    style: titleTextStyle.copyWith(
                        color: Color(0xffC3E3F2),
                        fontSize: 40,
                        letterSpacing: 2,
                        fontFamily: "Network"),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () => navigatePage(context, className: InfluencerIndex()),
            child: Container(
              margin: EdgeInsets.only(
                  left: v16 * 3, right: v16 * 3, top: v16 * 1.4),
              child: normalButton(
                  v16: v16 * 1, bgColor: APP_ACCENT, title: "Influenca"),
            ),
          ),
        ]),
      ),
    );
  }

  Container priceTile(
      {required double v16, required String price, required String views}) {
    return Container(
      // margin: EdgeInsets.only(top: v16, bottom: v16 / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Text(
                views,
                style: titleTextStyle.copyWith(
                  color: APP_ACCENT,
                ),
              ),
              Text(
                ' views',
                style: normalTextStyle.copyWith(
                  color: APP_ACCENT,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text(
                  "UGX ",
                  style: normalTextStyle.copyWith(color: APP_PRIMARY),
                ),
              ),
              Container(
                child: Text(
                  price,
                  style: titleTextStyle.copyWith(color: APP_BLACK),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
