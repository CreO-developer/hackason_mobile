import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../entities/scores.dart';

@RestApi(baseUrl: "http://localhost:8000")
abstract class ScoreRepository {
  // factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;
  @POST("/mock/question1")
  Future<Scores> submitString(@Body() Map<String, dynamic> data); // Mapに変更
}
