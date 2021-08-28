import 'package:status/pages/env.dart';

class Screenshot {
  final String clientId;
  final String projectId;
  final String influencaId;
  final String media;

  Screenshot(
      {required this.clientId,
      required this.projectId,
      required this.influencaId,
      required this.media});

  factory Screenshot.fromJson(Map<String, dynamic> json) {
    return Screenshot(
        clientId: json['client_id'],
        projectId: json['project_id'],
        influencaId: json['influenca_id'],
        media: '$MEDIA_URL${json['media']}');
  }
}
