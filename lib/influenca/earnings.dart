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
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: REAL_WHITE,
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Earnings",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView(
          padding:
              EdgeInsets.only(top: v16, left: v16, right: v16, bottom: v16),
          children: <Widget>[
            //
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Text(
                "Today",
                style: titleTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: v16, right: v16, bottom: v16 / 2, top: v16 / 2),
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: SHIMMER_DARK, width: 0.8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Verified Earnings",
                      style: titleTextStyle.copyWith(
                          color: APP_GREY, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    child: Text(
                      "UGX 4800",
                      style: titleTextStyle.copyWith(
                          fontSize: 28,
                          color: APP_PRIMARY,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(
                  left: v16, right: v16, bottom: v16 / 2, top: v16 / 2),
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: SHIMMER_DARK, width: 0.8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Pending Earnings",
                      style: titleTextStyle.copyWith(
                          color: APP_GREY, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    child: Text(
                      "UGX 4800",
                      style: titleTextStyle.copyWith(
                          fontSize: 28,
                          color: APP_PRIMARY,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16, top: 16),
              child: Text(
                "End of the Week",
                style: titleTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: v16, right: v16, bottom: v16 / 2, top: v16 / 2),
              margin: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: SHIMMER_DARK, width: 0.8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Verified Earnings",
                      style: titleTextStyle.copyWith(
                          color: APP_GREY, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    child: Text(
                      "UGX 4800",
                      style: titleTextStyle.copyWith(
                          fontSize: 28,
                          color: APP_PRIMARY,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
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
