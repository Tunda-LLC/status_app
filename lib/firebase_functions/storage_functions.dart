import 'dart:async';
import 'dart:io' as io;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:mime/mime.dart';
//ignore:
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:status/common/share.dart';
import 'package:status/common/toast.dart';
import 'package:path/path.dart';

/// The user selects a file, and the task is added to the list.
Future<firebase_storage.UploadTask> uploadFile(PickedFile file) async {
  firebase_storage.UploadTask uploadTask;
  String _tempFileName = basename(file.path);
  var _tempFile = File(file.path);

  // Create a Reference to the file
  firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
      .ref()
      .child('playground')
      .child('/${getRandomString(8)}_$_tempFileName');

  final metadata = firebase_storage.SettableMetadata(
      contentType: lookupMimeType(_tempFileName),
      customMetadata: {'picked-file-path': file.path});

  if (kIsWeb) {
    uploadTask = ref.putData(await file.readAsBytes(), metadata);
  } else {
    uploadTask = ref.putFile(io.File(file.path), metadata);
  }

  return Future.value(uploadTask);
}

// THE TASKS
uploadImagePost(context) async {
  PickedFile? file = await ImagePicker().getImage(source: ImageSource.gallery);
  if (file == null) {
    showErrorToast("No file was selected", context);
    return null;
  }

  firebase_storage.UploadTask task = await uploadFile(file);
}

uploadVideoPost(context) async {
  PickedFile? file = await ImagePicker().getVideo(source: ImageSource.gallery);
  if (file == null) {
    showErrorToast("No file was selected", context);
    return null;
  }

  firebase_storage.UploadTask task = await uploadFile(file);
}

Future<void> _downloadLink(context, firebase_storage.Reference ref) async {
  final link = await ref.getDownloadURL();

  await Clipboard.setData(ClipboardData(
    text: link,
  ));

  showSuccessToast('Success', context);
}
