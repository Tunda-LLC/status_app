class Project {
  String title;
  String caption;
  String url;
  String clientId;
  String id;
  bool is_done;

  Project(
      {required this.caption,
      required this.clientId,
      required this.title,
      required this.is_done,
      required this.id,
      required this.url});
}
