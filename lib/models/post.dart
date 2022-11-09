import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  final String description;
  final String uid;
  final String username;
  final String postId;
  final String profImage;
  final datePublished;
  final String postUrl;
  final List likes;

  Post({
    required this.profImage,
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.likes
  });

  Map<String, dynamic> toJson()=>{
    'description':username,
    'uid':uid,
    'username':username,
    'postId':postId,
    'profImage':profImage,
    'datePublished':datePublished,
    'postUrl':postUrl,
    'likes':likes
  };


  static Post fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String , dynamic>;

    return Post(
      description: snapshot['description'],
       uid: snapshot['uid'], 
       postId: snapshot['postId'],
        username: snapshot['username'],
         datePublished: snapshot['datePublished'],
          postUrl: snapshot['postUrl'],
           likes: snapshot['likes'],
           profImage: snapshot['profImage']
           );

  }

}