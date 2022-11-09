import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newinstagram/Resources/storage_mathod.dart';

class FirestoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<String> uploadPost(
    String description,
    Uint8List file, 
    String uid
  )async{
    String res = "some error accurred";
    try{
      String photoUrl = await StorageMethod().uploadImageToStorage("posts", file, true);
      
    }catch(e){}
  }
}