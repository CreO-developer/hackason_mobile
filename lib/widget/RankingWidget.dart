import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/entities/post.dart';
import 'package:mobile/presentation/screens/post_screen.dart';

class RankingWidget extends ConsumerWidget {
  const RankingWidget({Key? key, required this.posts}) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostScreen(post: posts[0]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Image.network('https://via.placeholder.com/480x640'),
            ),
          );
        },
      ),
    );
  }
}
