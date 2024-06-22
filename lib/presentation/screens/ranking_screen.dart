import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/presentation/notifier/ranking_notifier.dart';
import 'package:mobile/widget/RankingWidget.dart';

class RankingScreen extends ConsumerWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingProvider = ref.read(rankingNotifierProvider.notifier);
    final ranking = ref.watch(rankingNotifierProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: '図形',),
              Tab(text: 'アニメ',),
              Tab(text: '有名人',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RankingWidget(posts: ranking.anime),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
