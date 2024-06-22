import 'package:flutter/material.dart';
import 'package:mobile/application/state/user_score.dart';
import 'package:mobile/widget/startWidget.dart';

// Assuming `score` and `StarDisplay` are defined in your project.
class ResultQ1Q2CardWidget extends StatelessWidget {
  final UserScoresState
      userScoreState; // Replace `Score` with the appropriate type

  const ResultQ1Q2CardWidget({
    Key? key,
    required this.userScoreState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFCF1D4),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Color(0xFF2D6486),
          width: 3,
        ),
      ),
      margin: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 30.0),
              child: Text('お題: ${userScoreState.theme}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF373A4D),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '${userScoreState.scores.includeScore + userScoreState.scores.excludeScore + userScoreState.scores.peopleScore + userScoreState.scores.originalScore + (userScoreState.scores.faceScore ?? 0)}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFC93429),
                      ),
                    ),
                    TextSpan(
                      text: '/100点',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildCriteriaRows(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCriteriaRows() {
    return [
      _buildRow('枠内の密度', userScoreState.scores.includeScore),
      _buildRow('はみ出し度', userScoreState.scores.excludeScore),
      _buildRow('人数', userScoreState.scores.peopleScore),
      _buildRow('開発者の主観', userScoreState.scores.originalScore),
      // _buildRow('表情', userScoreState.scores.faceScore ?? 0),
    ];
  }

  Widget _buildRow(String title, int score) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Container(
          width: 150,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xFF373A4D),
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
          ),
        ),
        StarDisplay(
            score: score,
            scorePatern:
                (title == '枠内の密度' || title == 'はみ出し度') ? "max35" : "max15")
      ],
    );
  }
}
