import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/repository/report_repository.dart';
import 'package:mobile/infrastracture/datasource/report_data_source.dart';

final reportService = Provider(
  (ref) => ReportService(
    reportRepository: ref.read(reportRepository),
  ),
);

class ReportService {
  ReportService({required ReportRepository reportRepository})
      : _reportRepository = reportRepository;
  final ReportRepository _reportRepository;

  Future<void> addReport(String uid) async {
    await _reportRepository.addReport(uid);
  }
}
