import 'package:mobile/model/scores/scores.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'score_repository.g.dart';

@RestApi(baseUrl: "http://localhost:8000")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("/mock/question1")
  Future<Scores> submitString(@Body() Map<String, dynamic> data); // Mapに変更
}
