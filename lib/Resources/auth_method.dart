import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newinstagram/Resources/storage_mathod.dart';
import 'package:newinstagram/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails()async{
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore
    .collection('users')
    .doc(currentUser.uid)
    .get();

    return model.User.fromSnap(snap);

  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error accurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // add user to our Database
        String photoUrl = await StorageMethod()
            .uploadImageToStorage("profilePics", file, false);

        model.User user = model.User(
          bio: bio,
          email: email,
          uid: cred.user!.uid,
          followers: [],
          following: [],
          photoUrl: photoUrl,
          username: userName,
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

        // await _firestore.collection('users').add({
        //   'username':userName,
        //    'uid':cred.user!.uid,
        //    'email':email,
        //    'bio':bio,
        //    'followers':[],
        //    'following' : [],

        // }) ;

      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some error Eccurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        final sign = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      res = e.toString();
      Fluttertoast.showToast(
          msg: "please check your email or paass",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return res;
  }

Future<void> signOut()async{
  await _auth.signOut();
}


  
}
