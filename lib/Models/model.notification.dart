class NotificationModel {
  int id;
  String title;

  String body;

  NotificationModel(
      {required this.id, required this.title, required this.body});

  factory NotificationModel.fromJson(Map<String, dynamic> item) {
    return NotificationModel(
        id: item["idNotication"], title: item["title"], body: "body");
  }

  @override
  String toString() {
    return 'NotificationModel{id: $id, title: $title, body: $body}';
  }
}
