import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/entities/scores.dart';
import 'package:mobile/domain/repository/score_repository.dart';
import 'package:mobile/infrastracture/datasource/score_data_souce.dart';

final scoreService =
    Provider((ref) => ScoreService(ref.read(scoreRepositoryProvider)));

class ScoreService {
  final ScoreRepository _scoreRepository;

  ScoreService(this._scoreRepository);

  Future submitString1(Map<String, dynamic> data) async {
    final result = await _scoreRepository.submitString1(data);
    return result;
  }

  Future submitString2(Map<String, dynamic> data) async {
    final result = await _scoreRepository.submitString2(data);
    return result;
  }

  Future submitString3(Map<String, dynamic> data) async {
    final result = await _scoreRepository.submitString3(data);
    return result;
  }

  Future submitString4(Map<String, dynamic> data) async {
    final result = await _scoreRepository.submitString4(data);
    return result;
  }
}
