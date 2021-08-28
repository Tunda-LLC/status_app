import 'dart:convert';
import 'dart:io';

import 'package:status/main.dart';
import 'package:status/models/project.dart';
import 'package:status/models/screenshot.dart';
import 'package:status/pages/env.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

Dio dio = new Dio();
Future<List<Project>> fetchFeatured() async {
  final response = await http.get(Uri.parse('$API_URL/featured'),
      headers: {"authorization": await retrieveToken()});

  List<Project> results = [];
  var jsonD = jsonDecode(response.body);
  for (var row in jsonD['data']) {
    try {
      Project _pdt = Project.fromJson(row);
      results.add(_pdt);
    } catch (e) {
      // print('TOKEN ERROR: $e');
    }
  }
  return results;
}

Future<List<Project>> fetchHistory({required String myId}) async {
  final response = await http.get(
      Uri.parse('$API_URL/clients/$myId/my_projects'),
      headers: {"authorization": await retrieveToken()});

  List<Project> results = [];
  var jsonD = jsonDecode(response.body);
  for (var row in jsonD['data']) {
    try {
      Project _pdt = Project.fromJson(row);
      results.add(_pdt);
    } catch (e) {
      // print('TOKEN ERROR: $e');
    }
  }
  return results;
}

Future<List<Project>> fetchGigs() async {
  final response = await http.get(Uri.parse('$API_URL/gigs'),
      headers: {"authorization": await retrieveToken()});

  List<Project> results = [];
  var jsonD = jsonDecode(response.body);
  for (var row in jsonD['data']) {
    try {
      Project _pdt = Project.fromJson(row);
      results.add(_pdt);
    } catch (e) {
      print('TOKEN ERROR: $e');
    }
  }
  return results;
}

Future<List<Project>> fetchAcceptedGigs({required String myId}) async {
  final response = await http.get(
      Uri.parse('$API_URL/influencas/$myId/accepted_gigs'),
      headers: {"authorization": await retrieveToken()});

  List<Project> results = [];
  var jsonD = jsonDecode(response.body);
  if (jsonD['data'] is Iterable) {
    for (var row in jsonD['data']) {
      try {
        Project _pdt = Project.fromJson(row);
        results.add(_pdt);
      } catch (e) {
        print('TOKEN ERROR: $e');
      }
    }
  } else {
    try {
      Project _pdt = Project.fromJson(jsonD['data']);
      results.add(_pdt);
    } catch (e) {
      print('TOKEN ERROR: $e');
    }
  }
  return results;
}

Future<List<Screenshot>> fetchScreenshots(String myId, String projectId) async {
  final response = await http.get(
      Uri.parse('$API_URL/clients/$myId/projects/$projectId'),
      headers: {"authorization": await retrieveToken()});

  List<Screenshot> results = [];
  var jsonD = jsonDecode(response.body);
  for (var row in jsonD['data']) {
    try {
      Screenshot _pdt = Screenshot.fromJson(row);
      results.add(_pdt);
    } catch (e) {
      print('TOKEN ERROR: $e');
    }
  }
  return results;
}

userLogIn({required String email}) async {
  try {
    var response = await dio.post('$API_URL/login', data: {'email': email});
    // print("CODE: ${response.toString()}");
    if (response.statusCode == 200) {
      // print('donedd');
      var jsonData = json.decode(response.toString());
      await saveToken(jsonData['token'], jsonData['user']['id']);

      // print(jsonData['user']);
      return true;
    } else {
      if (response.statusCode == 404) {
        return false;
      }
      return false;
    }
  } catch (e) {
    // print('DIO ERROR: $e');
    return false;
  }
}

/* == SIGN UP == */
userSignUp({
  required String email,
  String countryId = '9d23adfb-ed67-4b1b-abe9-f14076bd1a09',
}) async {
  try {
    var response = await dio.post('$API_URL/register',
        data: {'email': email, 'cpuntry_id': countryId});
    // print("CODE: ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonData = json.decode(response.toString());
      await saveToken(jsonData['token'], jsonData['user']['id']);
      return true;
    } else {
      // print("CODE: ${response.statusCode}");
      return false;
    }
  } catch (e) {
    // print("Error: ${e.toString()}");
    return false;
  }

  // print("DATA: ${response.data}");
}

// product upload
productUpload({
  required File media,
  required String name,
  required String phone,
  required String views,
  required String price,
}) async {
  try {
    Dio dio = new Dio();
    Map<String, dynamic> inputs = {
      'name': name,
      'phone': phone,
      'views': views,
      'price': price,
      'media': await MultipartFile.fromFile(media.path),
    };

    FormData formData = FormData.fromMap(inputs);

    try {
      var response = await dio.post('$API_URL/register', data: formData);
      // print("CODE: ${response.statusCode}");
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.toString());
        // await saveToken(jsonData['token']);
        // return User.fromJson(json: jsonData['user']);
      } else {
        // print("CODE: ${response.statusCode}");
        return 'Error';
      }
    } catch (e) {
      // print("Error: ${e.toString()}");
      return 'ERROR: $e';
    }
  } catch (e) {
    // print("ST: ${e.toString()}");
  }

  // print("DATA: ${response.data}");
}

acceptGig({required String myId, required String projectId}) async {
  await http.get(
      Uri.parse('$API_URL/influencas/$myId/projects/$projectId/accept'),
      headers: {"authorization": await retrieveToken()});
}
