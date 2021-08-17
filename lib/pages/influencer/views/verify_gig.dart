import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:status/common/colors.dart';

class VerifyGig extends StatefulWidget {
  @override
  _VerifyGigState createState() {
    return _VerifyGigState();
  }
}

class _VerifyGigState extends State<VerifyGig> {
  List images = [];
  List<File> _finalImages = [];
  File? _imageFile;
  @override
  void initState() {
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
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
            color: APP_BLACK,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Verify Gig",
          style: TextStyle(color: APP_BLACK, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: <Widget>[
          buildGridView(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: v16, vertical: v16),
            child: Text(
              "Katooke's Ads sdjdfjsdfjdf jfjfvjfdjdfj jfjdfjdfj jfjdfjdf jfjfjfdj jfjdfjdf jjdfjdfj jfjfdjjdf jdfjdffdjj",
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: titleTextStyle.copyWith(color: APP_GREY),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: v16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      "Upload atleast 2 screenshots from different social media",
                      textAlign: TextAlign.center,
                      style: normalTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // BUTTON
          Container(
              margin: EdgeInsets.only(
                  left: v16 / 2, right: v16 / 2, bottom: v16 / 2, top: v16),
              child: normalButton(
                  v16: v16 / 1.8, bgColor: APP_BLACK, title: "Verify Gig")),
        ],
      ),
    );
  }

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Image.file(
                  uploadModel.imageFile!,
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
                        images.replaceRange(index, index + 1, ['Add Image']);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  }

  Future _onAddImageClick(int index) async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    var cow = pickedFile?.path;
    setState(() {
      _imageFile = File(cow!);
      getFileImage(index);
    });
  }

  void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();

    // _imageFile.then((file) async {
    setState(() {
      ImageUploadModel imageUpload = new ImageUploadModel();
      imageUpload.isUploaded = false;
      imageUpload.uploading = false;
      imageUpload.imageFile = _imageFile!;
      imageUpload.imageUrl = '';
      images.replaceRange(index, index + 1, [imageUpload]);
    });
    // });
  }
}

class ImageUploadModel {
  bool? isUploaded;
  bool? uploading;
  File? imageFile;
  String? imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}
