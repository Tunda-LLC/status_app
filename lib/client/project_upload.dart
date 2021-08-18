import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import 'package:status/pages/client/adlists.dart';
import 'package:status/pages/client/choose_days.dart';

class ProjectUpload extends StatefulWidget {
  const ProjectUpload({Key? key}) : super(key: key);

  @override
  _ProjectUploadState createState() => _ProjectUploadState();
}

class _ProjectUploadState extends State<ProjectUpload> {
  late PageController _pageController;
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
          "New Project",
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
                "Enter a title for the project",
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
            InkWell(
              onTap: () => onRead(),
              child: Container(
                margin: EdgeInsets.only(top: v16 * 1.5, bottom: v16),
                child:
                    normalButton(v16: v16, bgColor: APP_ACCENT, title: "Next"),
              ),
            ),
          ]),
          AdsListV3(),
          ChooseDays(),
        ]),
      ),
    );
  }

  void onRead() {
    final dbRef = FirebaseDatabase.instance.reference();
    dbRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  onSent() {
    final dbRef = FirebaseDatabase.instance.reference();
    dbRef
        .child("flutterDevsTeam7")
        .set({'name': 'Navy', 'description': 'Associate Software Engineer'});
  }

  void updateData() {
    final dbRef = FirebaseDatabase.instance.reference();
    dbRef.child('flutterDevsTeam1').update({'description': 'CEO'});
    dbRef.child('flutterDevsTeam2').update({'description': 'Team Lead'});
    dbRef
        .child('flutterDevsTeam3')
        .update({'description': 'Senior Software Engineer'});
  }

  void deleteData() {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child('flutterDevsTeam1').remove();
    databaseReference.child('flutterDevsTeam2').remove();
    databaseReference.child('flutterDevsTeam3').remove();
  }

  // onCow() {
  //   firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
  //       .ref('images/defaultProfile.png');
  // }
}
