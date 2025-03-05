import 'package:cloud_firestore/cloud_firestore.dart';

class Reply {
  String id;
  String content;
  final String? uid;
  var createdOn;

  Reply({
    required this.id,
    required this.content,
    this.uid,
    required this.createdOn,
  });

  factory Reply.fromMap(map) {
    return  Reply(
      id: map['id'],
      content: map['content'],
      uid: map['uid'],
      createdOn: (map['createdOn'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'uid': uid,
      'createdOn': createdOn,
    };
  }
}
