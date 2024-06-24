import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';

@freezed
class Report with _$Report {
  const factory Report({
    required List<String> reports,
  }) = _Report;
}
