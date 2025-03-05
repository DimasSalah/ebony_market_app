enum DoucmentType {
  Post,
  Comment,
  Reply,
}

extension ParseToString on DoucmentType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

class Report {
  String id;
  String contentId;
  String documentType;
  String? imageUrl;
  String content;
  String? uid;
  List<String> users;

  Report({
    required this.id,
    required this.contentId,
    required this.documentType,
    this.imageUrl,
    required this.uid,
    required this.content,
    required this.users,
  });

  factory Report.fromMap(map) {
    List<String> usersList = [];

    if (map['users'] != null) {
      map['users'].forEach((reply) => usersList.add(reply));
    }

    return new Report(
      id: map['id'],
      contentId: map['contentId'],
      documentType: map['documentType'],
      // DoucmentType.values.byName(map['type']).toString(),
      uid: map['uid'] ?? null,
      content: map['content'],
      imageUrl: map['imageUrl'] ?? null,
      users: usersList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contentId': contentId,
      'documentType': documentType,
      'uid': uid,
      'imageUrl': imageUrl,
      'content': content,
      'users': users,
    };
  }
}
