import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final int score;
  final String scorePatern;

  const StarDisplay({Key? key, required this.score, required this.scorePatern})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int starCount = 0;
    if (scorePatern == 'max35') {
      starCount = scoreToStarsMax35(score);
    } else if (scorePatern == 'max15') {
      starCount = scoreToStarsMax15(score);
    } else if (scorePatern == 'max45') {
      starCount = scoreToStarsMax45(score);
    } else if (scorePatern == 'max20') {
      starCount = scoreToStartMax20(score);
    } else {
      starCount = score;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < starCount ? Icons.star : Icons.star,
          color: index < starCount ? Colors.amber : Colors.grey,
          size: 20,
        );
      }),
    );
  }

  int scoreToStarsMax35(int score) {
    return (score / 7).ceil(); // 35を5で割ると7になるため、得点を7で割った値を切り上げる
  }

  int scoreToStarsMax15(int score) {
    return (score / 3).ceil(); // 15を5で割ると3になるため、得点を3で割った値を切り上げる
  }

  int scoreToStarsMax45(int score) {
    return (score / 9).ceil(); // 100を5で割ると20になるため、得点を5で割った値を切り上げる
  }

  int scoreToStartMax20(int score) {
    return (score / 4).ceil(); // 20を5で割ると4になるため、得点を4で割った値を切り上げる
  }
}
