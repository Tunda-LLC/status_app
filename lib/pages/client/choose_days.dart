import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';

import 'enter_number.dart';

class ChooseDays extends StatefulWidget {
  const ChooseDays({Key? key}) : super(key: key);

  @override
  _ChooseDaysState createState() => _ChooseDaysState();
}

class _ChooseDaysState extends State<ChooseDays> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    return Scaffold(
        body: Container(
            width: width,
            height: height,
            child: ListView(
                padding:
                    EdgeInsets.symmetric(horizontal: v16, vertical: v16 * 1.5),
                children: <Widget>[
                  //
                  Container(
                    padding: EdgeInsets.only(bottom: v16),
                    child: Text(
                      "Enter the number of days",
                      style: titleTextStyle.copyWith(
                          color: APP_ACCENT, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    child: TextField(
                      // controller: _nameController,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: InputDecoration(
                          focusColor: APP_PRIMARY,
                          border: OutlineInputBorder(
                            gapPadding: 2,
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: v16, bottom: v16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Price per day",
                            style: titleTextStyle.copyWith(
                                color: APP_ACCENT, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "UGX ",
                                style: normalTextStyle.copyWith(color: APP_RED),
                              ),
                            ),
                            Container(
                              child: Text(
                                "2000",
                                style: titleTextStyle.copyWith(
                                    color: APP_BLACK,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    color: APP_GREY,
                    thickness: 1.2,
                  ),

                  Container(
                    padding: EdgeInsets.only(top: v16 * 0.5, bottom: v16 * 1.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Total",
                            style: titleTextStyle.copyWith(
                                color: APP_ACCENT, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "UGX ",
                                style: normalTextStyle.copyWith(color: APP_RED),
                              ),
                            ),
                            Container(
                              child: Text(
                                "2000",
                                style: titleTextStyle.copyWith(
                                    color: APP_BLACK,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () =>
                        navigatePage(context, className: EnterNumber()),
                    child: Container(
                      margin: EdgeInsets.only(top: v16, bottom: v16),
                      child: normalButton(
                          v16: v16,
                          bgColor: APP_ACCENT,
                          title: "Confirm Order"),
                    ),
                  ),
                ])));
  }
}
