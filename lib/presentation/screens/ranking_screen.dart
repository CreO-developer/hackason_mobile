import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/presentation/notifier/ranking_notifier.dart';

class RankingScreen extends ConsumerWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingProvider = ref.read(rankingNotifierProvider.notifier);
    final ranking = ref.watch(rankingNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ランキング画面'),
      ),
      body: Column(
        children: [
          Center(
            child: const Text('こちらはランキング画面です'),
          )
        ],
      ),
    );
  }
}
