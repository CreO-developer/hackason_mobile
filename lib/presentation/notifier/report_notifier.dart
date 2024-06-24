import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/application/service/report_service.dart';
import 'package:mobile/domain/entities/report.dart';


final reportNotifierProvider =
    StateNotifierProvider<ReportStateNotifier, Report>((ref) {
      final reportNotifier = ReportStateNotifier(reportService: ref.read(reportService));
  return reportNotifier;
});

class ReportStateNotifier extends StateNotifier<Report> {
  ReportStateNotifier({required ReportService reportService})
      : _reportService = reportService,
        super(Report(reports: []));

  final ReportService _reportService;

  Future<void> addReport(String uid) async {
    await _reportService.addReport(uid);
  }
}
