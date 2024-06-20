import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domain/entities/post.dart';

part 'ranking.freezed.dart';

@freezed
class Ranking with _$Ranking {
  const factory Ranking({
    required List<Post> shapes,
    required List<Post> comedian,
    required List<Post> anime,
  }) = _Ranking;
}
