import 'package:cdds/src/model/report.dart';
import 'package:cdds/src/services/drug_database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ReportDatabaseInterface {
  Future<Report?> addReport(Report report);

  Future<List<Report>> getReportlist(String forDrugId);
}

class ReportDatabaseService extends ReportDatabaseInterface {
  CollectionReference reports = FirebaseFirestore.instance.collection('reports');
  final drugDbService = DrugDatabaseService();
  @override
  Future<Report?> addReport(Report report) async {
    final drug = await drugDbService.findDrugbyId(report.drugId);
    if (drug != null) {
      await reports.doc(drug.name).set(report.toDocument());
    }
  }

  @override
  Future<List<Report>> getReportlist(String forDrugId) async {
    List<Report> reportResults = [];
    final results = await reports.where("drugId", isEqualTo: forDrugId).get();

    for (var result in results.docs) {
      if (result.exists) {
        final doc = Report.fromDocument(result.data() as Map<String, dynamic>);
        reportResults.add(doc);
      } else {
        continue;
      }
    }
    return reportResults;
  }
}
