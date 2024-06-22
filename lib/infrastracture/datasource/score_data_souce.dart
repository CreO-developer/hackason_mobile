import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/repository/score_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(); // Configure Dio instance if needed (e.g., adding interceptors)
});

final scoreRepositoryProvider = Provider<ScoreRepository>((ref) {
  final dio = ref.read(dioProvider);
  return ScoreRepository(dio);
});
