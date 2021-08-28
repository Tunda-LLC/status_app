import 'package:flutter/material.dart';
import 'package:status/client/payment.dart';
import 'package:status/common/colors.dart';
// import 'package:status/pages/client/payment.dart';

class EnterNumber extends StatefulWidget {
  const EnterNumber({Key? key}) : super(key: key);

  @override
  _EnterNumberState createState() => _EnterNumberState();
}

class _EnterNumberState extends State<EnterNumber> {
  late PageController _pageController;
  late TextEditingController _phoneController;
  int _verifyPage = 1;
  onSentFirst() {
    _pageController.animateToPage(
      _verifyPage,
      duration: Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
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
            "Checkout",
            style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          width: width,
          height: height,
          child: PageView(controller: _pageController, children: <Widget>[
            ListView(padding: EdgeInsets.all(v16), children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: v16),
                child: Text(
                  "Enter phone number you are paying from",
                  style: titleTextStyle.copyWith(
                      fontWeight: FontWeight.w500, color: APP_ACCENT),
                ),
              ),
              Container(
                child: TextField(
                  controller: _phoneController,
                  autofocus: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                      focusColor: APP_PRIMARY,
                      border: OutlineInputBorder(
                        gapPadding: 2,
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      )),
                ),
              ),
              InkWell(
                onTap: () => onSentFirst(),
                child: Container(
                  margin: EdgeInsets.only(top: v16, bottom: v16),
                  child: normalButton(
                      v16: v16, bgColor: APP_ACCENT, title: "Next"),
                ),
              ),
            ]),
            PayNow()
          ]),
        ));
  }
}
