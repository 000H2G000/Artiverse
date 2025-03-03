import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserEventRecord extends FirestoreRecord {
  UserEventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "EventList" field.
  List<DocumentReference>? _eventList;
  List<DocumentReference> get eventList => _eventList ?? const [];
  bool hasEventList() => _eventList != null;

  void _initializeFields() {
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _eventList = getDataList(snapshotData['EventList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UserEvent');

  static Stream<UserEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserEventRecord.fromSnapshot(s));

  static Future<UserEventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserEventRecord.fromSnapshot(s));

  static UserEventRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserEventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserEventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserEventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserEventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserEventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserEventRecordData({
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'UserRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserEventRecordDocumentEquality implements Equality<UserEventRecord> {
  const UserEventRecordDocumentEquality();

  @override
  bool equals(UserEventRecord? e1, UserEventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.eventList, e2?.eventList);
  }

  @override
  int hash(UserEventRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.eventList]);

  @override
  bool isValidKey(Object? o) => o is UserEventRecord;
}
