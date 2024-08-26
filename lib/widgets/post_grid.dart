import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/utils/global_variables.dart';

class PostGrid extends StatefulWidget {
  const PostGrid({super.key});

  @override
  State<PostGrid> createState() => _PostGridState();
}

class _PostGridState extends State<PostGrid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('posts').get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => Image(
            image: NetworkImage(
                (snapshot.data! as dynamic).docs[index]['postUrl']),
            fit: BoxFit.fill,
          ),
          staggeredTileBuilder: (index) =>
              MediaQuery.of(context).size.width > webScreenSize
                  ? StaggeredTile.count(
                      (index % 7 == 0) ? 1 : 1, (index % 7 == 0) ? 1 : 1)
                  : StaggeredTile.count(
                      (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        );
      },
    );
  }
}
