class Item {
  final String title;
  bool isDone;
  Item({this.isDone = false, this.title});

  void toggleStatus() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() => {
        "title": title,
        "isDone": isDone,
      };

  Item.fromMap(Map<String, dynamic> map)
      : title = map["title"],
        isDone = map["isDone"];
}
