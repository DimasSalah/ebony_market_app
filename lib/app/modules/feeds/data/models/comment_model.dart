import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id;
  String content;
  final String? uid;
  List<String> replyIds;
  var createdOn;

  Comment({
    required this.id,
    required this.content,
    required this.uid,
    required this.replyIds,
    required this.createdOn,
  });

  //Map data from server
  factory Comment.fromMap(map) {
    List<String> repliesList = [];

    if (map['reply_ids'] != null) {
      map['reply_ids'].forEach((reply) => repliesList.add(reply));
    }

    return new Comment(
      id: map['id'],
      content: map['content'],
      uid: map['uid'],
      replyIds: repliesList,
      createdOn: (map['createdOn'] as Timestamp).toDate(),
    );
  }

  //Map data to send to server
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'uid': uid,
      'reply_ids': replyIds,
      'createdOn': createdOn,
    };
  }
}
