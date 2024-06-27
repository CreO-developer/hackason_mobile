import 'dart:math';

class QuestionConstants {
  static const Map<String, List<Map<String, String>>> questions = {
    'question1': [
      {'theme': '次の図形を作れ', 'filter': 'shape-1'},
      {'theme': '次の図形を作れ', 'filter': 'shape-2'},
      {'theme': '次の図形を作れ', 'filter': 'shape-3'},
      {'theme': '次の図形を作れ', 'filter': 'shape-4'},
      {'theme': '次の図形を作れ', 'filter': 'shape-5'},
      {'theme': '次の図形を作れ', 'filter': 'shape-6'},
      {'theme': '次の図形を作れ', 'filter': 'shape-7'},
      {'theme': '次の図形を作れ', 'filter': 'shape-8'},
      {'theme': '次の図形を作れ', 'filter': 'shape-9'},
      {'theme': '次の図形を作れ', 'filter': 'shape-10'},
    ],
    'question2': [
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-1'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-2'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-3'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-4'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-5'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-6'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-7'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-8'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-9'},
      {'theme': '次の組体操を作れ', 'filter': 'kumitaiso-10'},
    ],
    'question3': [
      {'theme': '有名人でこの形(ゲッツ)', 'filter': 'comedian-1'},
      {'theme': '有名人でこの形(クリロナ)', 'filter': 'comedian-2'},
      {'theme': '有名人でこの形(フォー)', 'filter': 'comedian-3'},
      {'theme': '有名人でこの形(明るい安村)', 'filter': 'comedian-4'},
      {'theme': '有名人でこの形(長野)', 'filter': 'comedian-5'},
      {'theme': '有名人でこの形(8.6秒バズーカ)', 'filter': 'comedian-6'},
      {'theme': '有名人でこの形(キャイーン)', 'filter': 'comedian-7'},
      {'theme': '有名人でこの形(T兄弟)', 'filter': 'comedian-8'},
      {'theme': '有名人でこの形(ペコパ)', 'filter': 'comedian-9'},
      {'theme': '有名人でこの形(武勇伝)', 'filter': 'comedian-10'},
    ],
    'question4': [
      {'theme': 'アニメ作れ(ジョ○立ち)', 'filter': 'anime-1'},
      {'theme': 'アニメ作れ(ドラゴン...)', 'filter': 'anime-2'},
      {'theme': 'アニメ作れ(未来へ)', 'filter': 'anime-3'},
      {'theme': 'アニメ作れ(ハンター...)', 'filter': 'anime-4'},
      {'theme': 'アニメ作れ(ワンピ...)', 'filter': 'anime-5'},
      {'theme': 'アニメ作れ(スラム...)', 'filter': 'anime-6'},
      {'theme': 'アニメ作れ(君の名は)', 'filter': 'anime-7'},
      {'theme': 'アニメ作れ(フィージョン)', 'filter': 'anime-8'},
      {'theme': 'アニメ作れ(プリキュ...)', 'filter': 'anime-9'},
      {'theme': 'アニメ作れ(シェー)', 'filter': 'anime-10'},
    ],
  };
  // static Map<String, String> getRandomQuestion1() {
  //   final random = Random();
  //   final question1List = questions['question1']!;
  //   return question1List[random.nextInt(question1List.length)];
  // }
  static Map<String, String> getRandomQuestion1(int rangeStart, int rangeEnd) {
    final random = Random();
    final question1List = questions['question1']!;

    // 範囲を確認し、有効な範囲を決定する
    int startIndex = max(0, rangeStart - 1); // 1から始まるインデックスを0から始まるインデックスに変換
    int endIndex = min(question1List.length, rangeEnd); // インデックスの上限を確認

    // 範囲内でランダムなインデックスを選択
    if (startIndex < endIndex) {
      int randomIndex = startIndex + random.nextInt(endIndex - startIndex);
      return question1List[randomIndex];
    } else {
      throw ArgumentError('Invalid range: $rangeStart to $rangeEnd');
    }
  }

  static Map<String, String> getRandomQuestion2(int rangeStart, int rangeEnd) {
    final random = Random();
    final question1List = questions['question2']!;

    // 範囲を確認し、有効な範囲を決定する
    int startIndex = max(0, rangeStart - 1); // 1から始まるインデックスを0から始まるインデックスに変換
    int endIndex = min(question1List.length, rangeEnd); // インデックスの上限を確認

    // 範囲内でランダムなインデックスを選択
    if (startIndex < endIndex) {
      int randomIndex = startIndex + random.nextInt(endIndex - startIndex);
      return question1List[randomIndex];
    } else {
      throw ArgumentError('Invalid range: $rangeStart to $rangeEnd');
    }
  }

  static Map<String, String> getRandomQuestion3(int rangeStart, int rangeEnd) {
    final random = Random();
    final question1List = questions['question3']!;
    print("question3");
    // 範囲を確認し、有効な範囲を決定する
    int startIndex = max(0, rangeStart - 1); // 1から始まるインデックスを0から始まるインデックスに変換
    int endIndex = min(question1List.length, rangeEnd); // インデックスの上限を確認

    // 範囲内でランダムなインデックスを選択
    if (startIndex < endIndex) {
      int randomIndex = startIndex + random.nextInt(endIndex - startIndex);
      return question1List[randomIndex];
    } else {
      throw ArgumentError('Invalid range: $rangeStart to $rangeEnd');
    }
  }

  static Map<String, String> getRandomQuestion4(int rangeStart, int rangeEnd) {
    final random = Random();
    final question1List = questions['question4']!;
    print("呼ばれた");
    // 範囲を確認し、有効な範囲を決定する
    int startIndex = max(0, rangeStart - 1); // 1から始まるインデックスを0から始まるインデックスに変換
    int endIndex = min(question1List.length, rangeEnd); // インデックスの上限を確認

    // 範囲内でランダムなインデックスを選択
    if (startIndex < endIndex) {
      int randomIndex = startIndex + random.nextInt(endIndex - startIndex);
      return question1List[randomIndex];
    } else {
      throw ArgumentError('Invalid range: $rangeStart to $rangeEnd');
    }
  }
}
