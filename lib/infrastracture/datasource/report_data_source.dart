import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile/domain/repository/report_repository.dart';

final reportRepository = Provider((ref) => ReportDataSource());

class ReportDataSource implements ReportRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addReport(String uid) async {
    try {
      final reports = await db.collection('reports').doc('reportList').update({
        'reports': FieldValue.arrayUnion([uid]),
    });
    } catch(e) {
      print(e);
      return null;
    }
  }
}
