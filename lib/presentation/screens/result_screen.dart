import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/presentation/notifier/user_scores_notifer.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoresNotifier = ref.read(userScoresNotiferProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('結果画面'),
      ),
      body: Column(
        children: [
          const Text('あなたのスコアは'),
          Text(scoresNotifier.state.toString()),
        ],
      ),
    );
  }
}
