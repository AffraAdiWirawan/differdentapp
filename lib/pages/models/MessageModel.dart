class MessageModel {
  String sender;
  String text;
  bool seen;
  DateTime createdOn;

  MessageModel({required this.sender, required this.text, required this.seen, required this.createdOn});

  MessageModel.fromMap(Map<String, dynamic> map)
      : sender = map["sender"],
        text = map["text"],
        seen = map["seen"],
        createdOn = DateTime.parse(map["createdOn"]);

  Map<String, dynamic> toMap() {
    return {
      "sender": sender,
      "text": text,
      "seen": seen,
      "createdOn": createdOn.toIso8601String(),
    };
  }
}
