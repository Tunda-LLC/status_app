import 'package:status/pages/env.dart';

class Project {
  String name;
  String caption;
  String clientId;
  String mediaFileUrl;
  String price;
  String id;
  bool isDone;
  bool isVerified;
  String phone;
  String views;

  Project(
      {this.caption = "_",
      required this.clientId,
      required this.name,
      required this.isDone,
      required this.id,
      required this.isVerified,
      required this.phone,
      required this.views,
      required this.price,
      required this.mediaFileUrl});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        caption: json['caption'] ?? "_",
        clientId: json['client_id'],
        name: json['name'] ?? "_",
        isDone: json['is_done'].toString() == "1" ? true : false,
        id: json['id'],
        isVerified: json['is_verified'].toString() == "1" ? true : false,
        phone: json['phone'],
        views: json['views'] ?? "_",
        price: json['payment'] ?? "_",
        mediaFileUrl: '$MEDIA_URL${json['media_file']}');
  }
}
