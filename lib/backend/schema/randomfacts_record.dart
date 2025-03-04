import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RandomfactsRecord extends FirestoreRecord {
  RandomfactsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fact" field.
  List<String>? _fact;
  List<String> get fact => _fact ?? const [];
  bool hasFact() => _fact != null;

  void _initializeFields() {
    _fact = getDataList(snapshotData['fact']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('randomfacts');

  static Stream<RandomfactsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RandomfactsRecord.fromSnapshot(s));

  static Future<RandomfactsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RandomfactsRecord.fromSnapshot(s));

  static RandomfactsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RandomfactsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RandomfactsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RandomfactsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RandomfactsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RandomfactsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRandomfactsRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class RandomfactsRecordDocumentEquality implements Equality<RandomfactsRecord> {
  const RandomfactsRecordDocumentEquality();

  @override
  bool equals(RandomfactsRecord? e1, RandomfactsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.fact, e2?.fact);
  }

  @override
  int hash(RandomfactsRecord? e) => const ListEquality().hash([e?.fact]);

  @override
  bool isValidKey(Object? o) => o is RandomfactsRecord;
}
