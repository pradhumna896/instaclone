import 'package:flutter/material.dart';
import 'package:newinstagram/Screens/add_post_screen.dart';
import 'package:newinstagram/Screens/feed_screen.dart';
import 'package:newinstagram/Screens/profile_screen.dart';
import 'package:newinstagram/Screens/search_screen.dart';

const webScreenSize = 600;
const homeScreenItem = [
        FeedScreen() ,
        SearchScreen(),
        AddPostScreen(),
        Text("favorite"),
        ProfileScreen()
];

