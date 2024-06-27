import 'package:flutter/material.dart';
import 'package:mobile/application/state/user_score.dart';
import 'package:mobile/domain/entities/scores.dart';
import 'package:mobile/widget/RadarChart.dart';

// Assuming `score` and `StarDisplay` are defined in your project.
class ResultTotalCardWidget extends StatelessWidget {
  final List<UserScoresState>
      userScoreStates; // Replace `Score` with the appropriate type

  const ResultTotalCardWidget({
    Key? key,
    required this.userScoreStates,
  }) : super(key: key);

  Scores calculateTotalScores(List<UserScoresState> userScoresStates) {
    int includeScore = 0;
    int excludeScore = 0;
    int peopleScore = 0;
    int originalScore = 0;
    int faceScore = 0;

    for (var userScoresState in userScoresStates) {
      var scores = userScoresState.scores;
      includeScore += scores.includeScore;
      excludeScore += scores.excludeScore;
      peopleScore += scores.peopleScore;
      originalScore += scores.originalScore;
      if (scores.faceScore != null) {
        faceScore += scores.faceScore!;
      }
    }

    return Scores(
      includeScore: includeScore,
      excludeScore: excludeScore,
      peopleScore: peopleScore,
      originalScore: originalScore,
      faceScore: faceScore != 0 ? faceScore : null, // faceScoreが0のままならnullを返す
    );
  }

  int calculateTotalScore(Scores scores) {
    int total = scores.includeScore +
                scores.excludeScore +
                scores.peopleScore +
                scores.originalScore +
                (scores.faceScore ?? 0);
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final totalScores = calculateTotalScores(userScoreStates);
    final totalScore = calculateTotalScore(totalScores);

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
            const Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 30.0),
              child: Text('合計点:',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF373A4D),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '${totalScore}',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFC93429),
                      ),
                    ),
                    const TextSpan(
                      text: '/500点',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: _buildRadarChart(totalScores),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadarChart(Scores scores) {
    return SizedBox(
      height: 200,
      child: RadarChartWidget(scores: scores),
    );
  }
}
