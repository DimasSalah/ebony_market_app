import 'package:cloud_firestore/cloud_firestore.dart';

//the name before is post model

class FeedsModel {
  String id;
  String? imageUrl;
  String caption;
  final String? uid;
  List<String> commentIds;
  Timestamp uploadTime;
  List<String>? likes = List.empty(growable: true);

  FeedsModel({
    required this.id,
    this.imageUrl,
    required this.caption,
    required this.commentIds,
    required this.uid,
    required this.uploadTime,
    this.likes,
  });

  factory FeedsModel.fromMap(Map<String, dynamic> map) {
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

    return FeedsModel(
      id: map['id'],
      caption: map['caption'],
      imageUrl: map['imageUrl'],
      uid: map['uid'] ?? null,
      commentIds: commentsList,
      uploadTime: map['uploadTime'],
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

class Feed {
  final String id;
  final String userName;
  final String? userImage;
  final String? content;
  final String? image;
  final String timeAgo;
  final int likes;
  final int comments;
  final bool isLiked;

  Feed({
    required this.id,
    required this.userName,
    this.userImage,
    this.content,
    this.image,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    this.isLiked = false,
  });
}
