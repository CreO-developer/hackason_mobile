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
        appBar: 
         AppBar(
            title: const Column(
              children: [
                Text('ランキング', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('毎日0時に更新されます', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF54BD6B)),)
              ],
            ),
            bottom: const TabBar(
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold, // 選択されたタブの太字スタイル
              ),
              labelColor: Colors.black, // 選択されたタブの文字色
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal, // 未選択のタブの標準スタイル
              ),
              indicatorColor: Colors.black,
              dividerColor: Color(0x80373A4D),
              
              tabs: [
                Tab(text: '図形'),
                Tab(text: 'アニメ'),
                Tab(text: '有名人'),
              ],
            ),
          
            backgroundColor: const Color(0xFFFCF1D4),
        ),
        body: TabBarView(
          children: [
            RankingWidget(posts: ranking.shapes),
            RankingWidget(posts: ranking.anime),
            RankingWidget(posts: ranking.comedian),
          ],
        ),
      ),
    );
  }
}
