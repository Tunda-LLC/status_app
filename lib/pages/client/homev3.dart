import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:status/common/colors.dart';
import 'package:status/pages/client/project_upload.dart';

class HomeV3 extends StatefulWidget {
  const HomeV3({Key? key}) : super(key: key);

  @override
  _HomeV3State createState() => _HomeV3State();
}

class _HomeV3State extends State<HomeV3> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SCAFFOLD_BG,
        automaticallyImplyLeading: false,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "tunda",
          style: titleTextStyle.copyWith(
              color: APP_ACCENT,
              fontSize: 36,
              letterSpacing: 2,
              fontFamily: "Network"),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(
            padding:
                EdgeInsets.only(top: 4, bottom: v16 * 3, left: v16, right: v16),
            children: <Widget>[
              //
              Container(
                padding: EdgeInsets.only(top: v16, bottom: v16 / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: McCountingText(
                        begin: 4,
                        end: 53000000,
                        style: titleTextStyle.copyWith(
                            fontSize: 32, color: APP_GREY),
                        duration: Duration(seconds: 5),
                        curve: Curves.bounceInOut,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Estimated Audience",
                      style: titleTextStyle.copyWith(color: APP_ACCENT),
                    ),
                  ),
                ],
              ),

              InkWell(
                onTap: () => navigatePage(context, className: ProjectUpload()),
                child: Container(
                  margin: EdgeInsets.only(top: v16, bottom: v16),
                  child: normalButton(
                      v16: v16,
                      bgColor: APP_ACCENT,
                      title: "Create New Project"),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: v16, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Views/Day",
                      style: titleTextStyle.copyWith(
                        color: APP_ACCENT,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Price/Day",
                        style: titleTextStyle.copyWith(color: APP_BLACK),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(
                color: APP_GREY,
                thickness: 1.2,
              ),
              priceTile(v16),
              priceTile(v16),
              priceTile(v16),
              priceTile(v16),
              Divider(
                color: APP_GREY,
                thickness: 1.2,
              ),

              Container(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "We guarantee views NOT likes or interaction to posts",
                  textAlign: TextAlign.center,
                  style: normalTextStyle.copyWith(color: APP_GREY),
                ),
              ),
            ]),
      ),
    );
  }

  Container priceTile(double v16) {
    return Container(
      margin: EdgeInsets.only(top: v16, bottom: v16 / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "1,000 - 1,500",
            style: titleTextStyle.copyWith(
              color: APP_ACCENT,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Text(
                  "UGX ",
                  style: normalTextStyle.copyWith(color: APP_GREEN),
                ),
              ),
              Container(
                child: Text(
                  "2000",
                  style: titleTextStyle.copyWith(color: APP_BLACK),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
