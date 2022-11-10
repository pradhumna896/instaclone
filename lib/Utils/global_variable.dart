import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newinstagram/Screens/add_post_screen.dart';
import 'package:newinstagram/Screens/feed_screen.dart';
import 'package:newinstagram/Screens/profile_screen.dart';
import 'package:newinstagram/Screens/search_screen.dart';

const webScreenSize = 600;
List<Widget> homeScreenItem = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text("favorite"),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  )
];
