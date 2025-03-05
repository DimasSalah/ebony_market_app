import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityPost {
  String id;
  String? imageUrl;
  String caption;
  final String? uid;
  List<String> commentIds;
  var uploadTime;
  List<String>? likes = new List.empty(growable: true);

  CommunityPost({
    required this.id,
    this.imageUrl,
    required this.caption,
    required this.commentIds,
    required this.uid,
    required this.uploadTime,
    this.likes,
  });

  factory CommunityPost.fromMap(Map<String, dynamic> map) {
    List<String> commentsList = [];
    List<String> likesList = [];

    if (map.containsKey('likes')) {
      if (map['likes'] != null) {
        map['likes'].forEach((e) => likesList.add(e));
      }
    }

    if (map['comment_ids'] != null) {
      map['comment_ids'].forEach((e) => commentsList.add(e));
    }

    return new CommunityPost(
      id: map['id'],
      caption: map['caption'],
      imageUrl: map['imageUrl'],
      uid: map['uid'] ?? null,
      commentIds: commentsList,
      uploadTime: (map['uploadTime'] as Timestamp).toDate(),
      likes: likesList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'caption': caption,
      'imageUrl': imageUrl,
      'uid': uid,
      'comment_ids': commentIds,
      'uploadTime': uploadTime,
      'likes': likes,
    };
  }
}
