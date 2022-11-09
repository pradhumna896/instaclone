import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newinstagram/Resources/storage_mathod.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String res = "some error accurred";
    try {
      String photoUrl =
          await StorageMethod().uploadImageToStorage("posts", file, true);
      String postId = const Uuid().v1();
      Post post = Post(
          profImage: profImage,
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          likes: []);

      _firestore.collection('posts')
      .doc(postId)
      .set(post.toJson());
      res = 'success';
    } catch (e) {
      res =e.toString();
    }
    return res;
  }
}
