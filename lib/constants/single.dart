import 'dart:math';

class QuestionConstants {
  static const Map<String, List<Map<String, String>>> questions = {
    'question1': [
      {'theme': '三角形作ってください', 'filter': 'shape-1'},
      {'theme': '四角形作ってください', 'filter': 'shape-2'},
      {'theme': 'まる作ってください', 'filter': 'shape-3'},
      {'theme': '星の作ってください', 'filter': 'shape-4'},
      {'theme': 'これ作ってください', 'filter': 'shape-5'},
    ],
    'question2': [
      {'theme': 'ブリッジを作れ', 'filter': 'kumitaiso-1'},
      {'theme': '組体操2を作れ', 'filter': 'kumitaiso-2'},
      {'theme': '組体操3を作れ', 'filter': 'kumitaiso-3'},
      {'theme': '組体操4を作れ', 'filter': 'kumitaiso-4'},
    ],
    'question3': [
      {'theme': '芸人でこの形1', 'filter': 'comedian-1'},
      {'theme': '芸人でこの形2', 'filter': 'comedian-2'},
      {'theme': '芸人でこの形3', 'filter': 'comedian-3'},
      {'theme': '芸人でこの形4', 'filter': 'comedian-4'},
      {'theme': '芸人でこの形5', 'filter': 'comedian-5'},
    ],
    'question4': [
      {'theme': 'アニメ作ってください1', 'filter': 'anime-1'},
      {'theme': 'アニメ作ってください2', 'filter': 'anime-2'},
      {'theme': 'アニメ作ってください3', 'filter': 'anime-3'},
      {'theme': 'アニメ作ってください4', 'filter': 'anime-4'},
      {'theme': 'アニメ作ってください5', 'filter': 'anime-5'},
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
