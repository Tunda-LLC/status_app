import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:sweetsheet/sweetsheet.dart';

class PayNow extends StatefulWidget {
  const PayNow({Key? key}) : super(key: key);

  @override
  _PayNowState createState() => _PayNowState();
}

class _PayNowState extends State<PayNow> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          child: ListView(padding: EdgeInsets.all(v16), children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: v16),
              child: Text(
                "Send to the following",
                style: titleTextStyle.copyWith(
                    fontWeight: FontWeight.w500, color: APP_ACCENT),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(bottom: v16),
              child: Text(
                "MTN:",
                textAlign: TextAlign.start,
                style: titleTextStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              color: APP_GREY,
              thickness: 1.2,
            ),
            Container(
              padding: EdgeInsets.only(bottom: v16 * 0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: v16 * 1.5, bottom: 8),
                    child: Icon(
                      Icons.copy,
                      size: 18,
                      color: APP_GREY,
                    ),
                  ),
                  Text(
                    "0786520549",
                    textAlign: TextAlign.end,
                    style: titleTextStyle.copyWith(
                        fontWeight: FontWeight.w500, color: APP_ACCENT),
                  ),
                ],
              ),
            ),
            // Container(
            //   // padding: EdgeInsets.only(bottom: v16 * 0.8),
            //   child: Text(
            //     "Airtel:",
            //     textAlign: TextAlign.start,
            //     style: titleTextStyle.copyWith(fontWeight: FontWeight.w500),
            //   ),
            // ),
            // Divider(
            //   color: APP_GREY,
            //   thickness: 1.2,
            // ),
            // Container(
            //   padding: EdgeInsets.only(bottom: v16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: <Widget>[
            //       Container(
            //         padding: EdgeInsets.only(right: v16 * 1.5, bottom: 8),
            //         child: Icon(
            //           Icons.copy,
            //           size: 18,
            //           color: APP_GREY,
            //         ),
            //       ),
            //       Text(
            //         "0759479190",
            //         textAlign: TextAlign.end,
            //         style: titleTextStyle.copyWith(
            //             fontWeight: FontWeight.w500, color: APP_ACCENT),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(top: v16 * 0.5),
              child: Text(
                "Click below after paying to upload",
                textAlign: TextAlign.center,
                style: normalTextStyle.copyWith(
                    fontWeight: FontWeight.w500, color: APP_ACCENT),
              ),
            ),
            InkWell(
              onTap: () {
                final SweetSheet _sweetSheet = SweetSheet();
                _sweetSheet.show(
                  context: context,
                  title: Text(
                    "Attention",
                    style: TextStyle(fontFamily: "ProximaNova"),
                  ),
                  description: Text(
                    'Your payment will be verified in afew minutes',
                    style: titleTextStyle.copyWith(
                        fontFamily: "ProximaNova", color: REAL_WHITE),
                  ),
                  color: SweetSheetColor.NICE,
                  icon: Icons.payment_outlined,
                  positive: SweetSheetAction(
                    onPressed: () async {
                      //
                    },
                    title: 'CONTINUE',
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: v16, bottom: v16),
                child:
                    normalButton(v16: v16, bgColor: APP_ACCENT, title: "Paid"),
              ),
            ),
          ])),
    );
  }
}

class CustomSheetColor {
  Color main;
  Color accent;
  Color icon;

  CustomSheetColor(
      {required this.main, required this.accent, required this.icon});
}
