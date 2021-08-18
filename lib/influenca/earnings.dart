import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';

class Earnings extends StatefulWidget {
  const Earnings({Key? key}) : super(key: key);

  @override
  _EarningsState createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Earnings",
          style: titleTextStyle.copyWith(color: APP_BLACK),
        ),
        backgroundColor: REAL_WHITE,
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView(
          padding: EdgeInsets.only(
              top: v16, left: v16 / 2, right: v16 / 2, bottom: v16),
          children: <Widget>[
            //
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Text(
                "Today",
                style: titleTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Material(
                elevation: 2.8,
                child: Container(
                  padding: EdgeInsets.all(v16 / 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Verified Earnings",
                          style: titleTextStyle.copyWith(color: APP_GREY),
                        ),
                      ),
                      Container(
                        child: Text(
                          "UGX 4800",
                          style: titleTextStyle.copyWith(
                              fontSize: 28, color: APP_GREEN),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Material(
                elevation: 2.8,
                child: Container(
                  padding: EdgeInsets.all(v16 / 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Pending Earnings",
                          style: titleTextStyle.copyWith(color: APP_GREY),
                        ),
                      ),
                      Container(
                        child: Text(
                          "UGX 4800",
                          style: titleTextStyle.copyWith(
                              fontSize: 28, color: APP_PRIMARY),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16, top: 16),
              child: Text(
                "End of the Week",
                style: titleTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Material(
                elevation: 2.8,
                child: Container(
                  padding: EdgeInsets.all(v16 / 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Verified Earnings",
                          style: titleTextStyle.copyWith(color: APP_GREY),
                        ),
                      ),
                      Container(
                        child: Text(
                          "UGX 4800",
                          style: titleTextStyle.copyWith(
                              fontSize: 28, color: APP_GREEN),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 8, top: 16),
              child: Text(
                "You will only be paid for verified gigs. Thanks",
                textAlign: TextAlign.center,
                style: normalTextStyle.copyWith(color: APP_GREY),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
