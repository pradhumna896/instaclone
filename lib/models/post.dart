import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  final String description;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List postUrl;
  final List ;

  Post({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following
  });

  Map<String, dynamic> toJson()=>{
    'username':username,
    'uid':uid,
    'email':email,
    'photoUrl':photoUrl,
    'bio':bio,
    'followers':followers,
    'following':following
  };


  static Post fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String , dynamic>;

    return Post(
      email: snapshot['email'],
       uid: snapshot['uid'], 
       photoUrl: snapshot['photoUrl'],
        username: snapshot['username'],
         bio: snapshot['bio'],
          followers: snapshot['followers'],
           following: snapshot['following']);

  }

}