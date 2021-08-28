import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:status/client/adlists.dart';
import 'package:status/client/choose_days.dart';
import 'package:status/common/colors.dart';
import 'package:status/common/toast.dart';
// import 'package:status/pages/client/adlists.dart';
// import 'package:status/pages/client/choose_days.dart';

class ProjectUpload extends StatefulWidget {
  const ProjectUpload({Key? key}) : super(key: key);

  @override
  _ProjectUploadState createState() => _ProjectUploadState();
}

class _ProjectUploadState extends State<ProjectUpload> {
  late PageController _pageController;
  int _verifyPage = 1;
  late File uploaded;
  bool isUploaded = false;
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
          "New Advert",
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
                "Enter a title for your advert",
                style: titleTextStyle.copyWith(
                    fontWeight: FontWeight.w500, color: APP_ACCENT),
              ),
            ),
            Container(
              child: TextField(
                // controller: _nameController,
                autofocus: false,
                maxLines: 2,
                decoration: InputDecoration(
                    focusColor: APP_PRIMARY,
                    border: OutlineInputBorder(
                      gapPadding: 2,
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: v16),
              child: Text(
                "Press below to upload image",
                style: titleTextStyle.copyWith(
                    fontWeight: FontWeight.w500, color: APP_ACCENT),
              ),
            ),
            isUploaded
                ? Container(
                    margin: EdgeInsets.all(v16),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: <Widget>[
                          Image.file(
                            uploaded,
                            width: 300,
                            height: 300,
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: InkWell(
                              child: Icon(
                                Icons.remove_circle,
                                size: 32,
                                color: Colors.red,
                              ),
                              onTap: () {
                                setState(() {
                                  isUploaded = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.all(v16),
                    child: Card(
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _onAddImageClick();
                        },
                      ),
                    ),
                  ),
            InkWell(
              onTap: () => onSentFirst(),
              child: Container(
                margin: EdgeInsets.only(top: v16 * 1.5, bottom: v16),
                child:
                    normalButton(v16: v16, bgColor: APP_ACCENT, title: "Next"),
              ),
            ),
          ]),
          AdsListV3(),
        ]),
      ),
    );
  }

  Future _onAddImageClick() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (File(image!.path).lengthSync() > 8000000) {
      showToast("Image too large", context);
      return;
    }
    setState(() {
      uploaded = File(image.path);
      isUploaded = true;
    });
  }
}
