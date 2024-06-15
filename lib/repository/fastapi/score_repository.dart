import 'package:dio/dio.dart';
import 'package:mobile/model/scores/scores.dart';
import 'package:retrofit/retrofit.dart';

part 'score_repository.g.dart';

@RestApi(baseUrl: "https://api.example.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @POST("/data/submit")
  Future<Scores> submitString(@Body() String inputString);
}