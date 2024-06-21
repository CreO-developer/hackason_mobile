import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/application/state/post_state.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({
    super.key,
    this.post,
  });

  final PostState? post;


  @override
  Widget build(BuildContext context) {
    print(post);
    return Scaffold(
      appBar: AppBar(
        title: Text('ランキング − 総合'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            context.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  'https://via.placeholder.com/480x640', // ここにiPhoneで撮った写真のURLを指定します
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ユーザ名${post?.name}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '写真の説明2',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '写真の説明3',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
