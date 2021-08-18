import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:math';
import 'package:flutter/foundation.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:esys_flutter_share/esys_flutter_share.dart';

Future<void> shareImageFromUrl(
    {required String appName,
    required Function onError,
    String? caption,
    required String url}) async {
  try {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file(
        appName, '$appName${getRandomString(8)}.png', bytes, 'image/png',
        text: caption);
  } catch (e) {
    onError(e);
  }
}

Future<void> shareVideoFromUrl(
    {required String appName,
    required Function onError,
    String? caption,
    required String url}) async {
  try {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file(
        appName, '$appName${getRandomString(8)}.mp4', bytes, 'video/mp4',
        text: caption);
  } catch (e) {
    onError(e);
  }
}

String getRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}
