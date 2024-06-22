import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/state/user_score.dart';
import 'package:mobile/domain/entities/scores.dart';
import 'package:mobile/presentation/notifier/user_scores_notifer.dart';
import 'package:mobile/widget/Result_q3q4.dart';
import 'package:mobile/widget/StartWidget.dart';
import 'package:mobile/widget/result_q1q2.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoresNotifier = ref.watch(userScoresNotiferProvider);
    final pageController = PageController();
    // mockデータ
    List<UserScoresState> mockUserScores = [
      UserScoresState(
        imgUrl: '8ca005c7-8e7b-40c8-b8d2-35b92823356a.jpeg',
        filter: 'shape-2',
        theme: 'まる作ってください',
        scores: Scores(
            includeScore: 10,
            excludeScore: 10,
            peopleScore: 7,
            originalScore: 7,
            faceScore: 0),
      ),
      UserScoresState(
        imgUrl: 'f6774077-957f-4280-b924-a1a42c170c69.jpeg',
        filter: 'kumitaiso-2',
        theme: '組体操3を作れ',
        scores: Scores(
            includeScore: 15,
            excludeScore: 15,
            peopleScore: 0,
            originalScore: 0,
            faceScore: 0),
      ),
      UserScoresState(
        imgUrl: '2c3136c6-669d-4fe4-85c9-b991ebfa03a0.jpeg',
        filter: 'comedian-2',
        theme: '芸人でこの形2',
        scores: Scores(
            includeScore: 35,
            excludeScore: 35,
            peopleScore: 10,
            originalScore: 10,
            faceScore: 10),
      ),
      UserScoresState(
        imgUrl: 'a9d76b9e-c2f1-4963-8608-e202445647fb.jpeg',
        filter: 'anime-3',
        theme: 'アニメ作ってください3',
        scores: Scores(
            includeScore: 20,
            excludeScore: 20,
            peopleScore: 10,
            originalScore: 10,
            faceScore: 5),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          const Text("リザルト",
              style: (TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, // フォントの太さをboldに設定
                color: Color(0xFF373A4D),
              ))),
          SizedBox(
            height: 450, // ここでPageViewの高さを指定
            child: PageView.builder(
              controller: pageController,
              itemCount: mockUserScores.length,
              itemBuilder: (_, index) {
                final score = mockUserScores[index];
                if (index == 0 || index == 1) {
                  return SizedBox(
                    width: 330, // Specify the width for these pages
                    child: ResultQ1Q2CardWidget(
                      userScoreState: score,
                    ),
                  );
                } else if (index == 2 || index == 3) {
                  return SizedBox(
                    width: 330, // Specify the width for these pages
                    child: ResultQ3Q4CardWidget(
                      userScoreState: score,
                    ),
                  );
                } else {
                  // Optionally handle other indices if needed
                  return SizedBox(
                    width: 330, // Default case
                    child: Text("合計点"), // Replace with the appropriate widget
                  );
                }
              },
            ),
          ),
          AnimatedBuilder(
            animation: pageController,
            builder: (_, __) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    // scoresNotifier.length,
                    mockUserScores.length,
                    (index) => buildIndicator(index ==
                        (pageController.page ?? pageController.initialPage)
                            .round()),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Color(0xFFC93429) : Colors.grey,
      ),
    );
  }
}
