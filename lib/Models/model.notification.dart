class NotificationModel {
  int id;
  String title;
  String body;
  DateTime date ;

  NotificationModel(
      {required this.id, required this.title, required this.body,required this.date});

  factory NotificationModel.fromJson(Map<String, dynamic> item) {
    return NotificationModel(
        date: DateTime.parse(item["createdAt"]),
        id: item["idNotication"], title: item["title"], body: item["body"]);
  }

  @override
  String toString() {
    return 'NotificationModel{id: $id, title: $title, body: $body}';
  }
}
