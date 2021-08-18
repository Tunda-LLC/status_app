import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'dart:io' show Platform;

import 'package:status/common/colors.dart';
// import 'package:status/pages/client/choose_days.dart';

class AdsListV3 extends StatefulWidget {
  const AdsListV3({Key? key}) : super(key: key);

  @override
  _AdsListV3State createState() => _AdsListV3State();
}

class _AdsListV3State extends State<AdsListV3> {
  int ad_val = 4;
  late bool _2AdValue, _5AdValue, _12AdValue, _freeAdValue;
  bool _freeAd = false;
  // var _tokenBox = Hive.box(TokenBox);
  // String myId;

  @override
  void initState() {
    super.initState();
    _2AdValue = false;
    _5AdValue = false;
    _12AdValue = false;
    _freeAdValue = false;
    // myId = _tokenBox.get("id");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: v16, vertical: v16 * 1.5),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: v16),
            child: Text(
              "Choose a pricing plan",
              style: titleTextStyle.copyWith(
                  fontWeight: FontWeight.w500, color: APP_ACCENT),
            ),
          ),
// ====================================================================== //
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: _2AdValue ? APP_GOLD : APP_GREY, width: 1),
                borderRadius: BorderRadius.circular(4)),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: 0,
              groupValue: ad_val,
              activeColor: APP_GOLD,
              selected: _2AdValue,
              onChanged: (int? value) {
                setState(() {
                  ad_val = value!;
                  _2AdValue = true;
                  _5AdValue = false;
                  _12AdValue = false;
                  _freeAdValue = false;
                });
              },
              title: Text(
                "1,000 - 1,500 views/day",
                style: normalTextStyle.copyWith(
                    color: _2AdValue ? APP_GOLD : REAL_BLACK),
              ),
              subtitle: Text(
                "UGX 2,000 / day",
                style: normalTextStyle.copyWith(
                    color: _2AdValue ? APP_GOLD : REAL_BLACK),
              ),
            ),
          ),
// ========================================================================= //

// ====================================================================== //
          Container(
            margin: EdgeInsets.only(top: v16 * 1.5, bottom: v16 * 1.5),
            decoration: BoxDecoration(
                border: Border.all(
                    color: _5AdValue ? APP_GOLD : APP_GREY, width: 1),
                borderRadius: BorderRadius.circular(4)),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: 1,
              groupValue: ad_val,
              activeColor: APP_GOLD,
              selected: _5AdValue,
              onChanged: (int? value) {
                setState(() {
                  ad_val = value!;
                  _5AdValue = true;
                  _2AdValue = false;
                  _12AdValue = false;
                  _freeAdValue = false;
                });
              },
              title: Text(
                "5,000 - 5,500 views/day",
                style: normalTextStyle.copyWith(
                    color: _5AdValue ? APP_GOLD : REAL_BLACK),
              ),
              subtitle: Text(
                "UGX 4,000 / day",
                style: normalTextStyle.copyWith(
                    color: _5AdValue ? APP_GOLD : REAL_BLACK),
              ),
            ),
          ),
// ========================================================================= //
// ====================================================================== //
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: _12AdValue ? APP_GOLD : APP_GREY, width: 1),
                borderRadius: BorderRadius.circular(4)),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: 2,
              groupValue: ad_val,
              activeColor: APP_GOLD,
              selected: _12AdValue,
              onChanged: (int? value) {
                setState(() {
                  ad_val = value!;
                  _12AdValue = true;
                  _5AdValue = false;
                  _2AdValue = false;
                  _freeAdValue = false;
                });
              },
              title: Text(
                "10,000 - 12,000 views/day",
                style: normalTextStyle.copyWith(
                    color: _12AdValue ? APP_GOLD : REAL_BLACK),
              ),
              subtitle: Text(
                "UGX 8,000 / day",
                style: normalTextStyle.copyWith(
                    color: _12AdValue ? APP_GOLD : REAL_BLACK),
              ),
            ),
          ),
// ========================================================================= //
          InkWell(
            // onTap: () => navigatePage(context, className: ChooseDays()),
            child: Container(
              margin: EdgeInsets.only(top: v16 * 1.6, bottom: v16),
              child: normalButton(v16: v16, bgColor: APP_ACCENT, title: "Next"),
            ),
          ),
        ],
      ),
    );
  }
}
