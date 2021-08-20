class Project {
  String title;
  String caption;
  String url;
  String clientId;
  bool is_done;

  Project(
      {required this.caption,
      required this.clientId,
      required this.title,
      required this.is_done,
      required this.url});
}
