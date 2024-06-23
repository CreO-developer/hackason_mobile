import 'dart:math';

class QuestionConstants {
  static const Map<String, List<Map<String, String>>> questions = {
    'question1': [
      {'theme': '次の図形を作れ', 'filter': 'shape-1'},
      {'theme': '次の図形を作れ', 'filter': 'shape-2'},
      {'theme': '次の図形を作れ', 'filter': 'shape-3'},
      {'theme': '次の図形を作れ', 'filter': 'shape-4'},
      {'theme': '次の図形を作れ', 'filter': 'shape-5'},
    ],
    'question2': [
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-1'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-2'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-3'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-4'},
    ],
    'question3': [
      {'theme': '有名人でこの形(ゲッツ)', 'filter': 'comedian-1'},
      {'theme': '有名人でこの形(クリロナ)', 'filter': 'comedian-2'},
      {'theme': '有名人でこの形(フォー)', 'filter': 'comedian-3'},
      {'theme': '有名人でこの形(明るい...)', 'filter': 'comedian-4'},
      {'theme': '有名人でこの形', 'filter': 'comedian-5'},
    ],
    'question4': [
      {'theme': 'アニメ作れ(ジョ○立ち)', 'filter': 'anime-1'},
      {'theme': 'アニメ作れ(ドラゴン...)', 'filter': 'anime-2'},
      {'theme': 'アニメ作れ(未来へ)', 'filter': 'anime-3'},
      {'theme': 'アニメ作れ(ハンター...)', 'filter': 'anime-4'},
      {'theme': 'アニメ作れ(ワンピ...)', 'filter': 'anime-5'},
    ],
  };
  static Map<String, String> getRandomQuestion1() {
    final random = Random();
    final question1List = questions['question1']!;
    return question1List[random.nextInt(question1List.length)];
  }

  static Map<String, String> getRandomQuestion2() {
    final random = Random();
    final question2List = questions['question2']!;
    return question2List[random.nextInt(question2List.length)];
  }

  static Map<String, String> getRandomQuestion3() {
    final random = Random();
    final question3List = questions['question3']!;
    return question3List[random.nextInt(question3List.length)];
  }

  static Map<String, String> getRandomQuestion4() {
    final random = Random();
    final question4List = questions['question4']!;
    return question4List[random.nextInt(question4List.length)];
  }
}
