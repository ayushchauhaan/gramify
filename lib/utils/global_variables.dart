import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/add_post_screen.dart';
import 'package:instagram_clone/screen/feed_screen.dart';
import 'package:instagram_clone/screen/profile_screen.dart';
import 'package:instagram_clone/screen/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.build,
          color: Colors.purple[300],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Work in Progress",
          style: TextStyle(fontSize: 16, color: Colors.white),
        )
      ]),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
