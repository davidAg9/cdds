import 'package:cdds/src/model/drug.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DrugDatabaseInterface {
  Future<Drug?> findDrug(String name);
  Future<Drug?> findDrugbyId(String id);
  Future<Drug> addDrug(Drug drug);
  Future<void> batchAddDrug(List<Drug> drugs);
}

class DrugDatabaseService extends DrugDatabaseInterface {
  CollectionReference drugCollection = FirebaseFirestore.instance.collection('drugs');
  @override
  Future<Drug> addDrug(Drug drug) async {
    await drugCollection.doc(drug.dbId).set(drug.toDocument());
    return drug;
  }

  @override
  Future<void> batchAddDrug(List<Drug> drugs) {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (var drug in drugs) {
      batch.set(drugCollection.doc(drug.dbId), drug.toDocument());
    }
    return batch.commit();
  }

  @override
  Future<Drug?> findDrug(String name) async {
    final result = await drugCollection.where("name", isEqualTo: name).get();
    final fdrug = result.docs.first;
    if (fdrug.exists) {
      return Drug.fromDocument(fdrug.data() as Map<String, dynamic>);
    }
  }

  @override
  Future<Drug?> findDrugbyId(String id) async {
    final result = await drugCollection.doc(id).get();

    if (result.exists) {
      return Drug.fromDocument(result.data() as Map<String, dynamic>);
    }
  }
}
