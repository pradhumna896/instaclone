
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newinstagram/Resources/storage_mathod.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
      String res = "Some error accurred";
    try{
    
      if(email.isNotEmpty || password.isNotEmpty || userName.isNotEmpty || bio.isNotEmpty || file !=null){

        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        // add user to our Database
        String photoUrl = await StorageMethod().uploadImageToStorage("profilePics", file, false);

       await _firestore.collection('users').doc(cred.user!.uid).
       set(
          {'username':userName,
           'uid':cred.user!.uid,
           'email':email,
           'bio':bio,
           'followers':[],
           'following' : [],
           'photoUrl':photoUrl

          }) ;

        // await _firestore.collection('users').add({
        //   'username':userName,
        //    'uid':cred.user!.uid,
        //    'email':email,
        //    'bio':bio,
        //    'followers':[],
        //    'following' : [],

        // }) ;

      }
    }catch(e){
      res = e.toString();
    }
    return res ;
  }
}
