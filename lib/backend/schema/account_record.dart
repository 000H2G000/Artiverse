import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountRecord extends FirestoreRecord {
  AccountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "photo_url" field.
  DocumentReference? _photoUrl;
  DocumentReference? get photoUrl => _photoUrl;
  bool hasPhotoUrl() => _photoUrl != null;

  // "nomUtilisateur" field.
  String? _nomUtilisateur;
  String get nomUtilisateur => _nomUtilisateur ?? '';
  bool hasNomUtilisateur() => _nomUtilisateur != null;

  // "email" field.
  DocumentReference? _email;
  DocumentReference? get email => _email;
  bool hasEmail() => _email != null;

  // "motDePasse" field.
  String? _motDePasse;
  String get motDePasse => _motDePasse ?? '';
  bool hasMotDePasse() => _motDePasse != null;

  // "notificationPreferences" field.
  bool? _notificationPreferences;
  bool get notificationPreferences => _notificationPreferences ?? false;
  bool hasNotificationPreferences() => _notificationPreferences != null;

  void _initializeFields() {
    _photoUrl = snapshotData['photo_url'] as DocumentReference?;
    _nomUtilisateur = snapshotData['nomUtilisateur'] as String?;
    _email = snapshotData['email'] as DocumentReference?;
    _motDePasse = snapshotData['motDePasse'] as String?;
    _notificationPreferences = snapshotData['notificationPreferences'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Account');

  static Stream<AccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountRecord.fromSnapshot(s));

  static Future<AccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountRecord.fromSnapshot(s));

  static AccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccountRecordData({
  DocumentReference? photoUrl,
  String? nomUtilisateur,
  DocumentReference? email,
  String? motDePasse,
  bool? notificationPreferences,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'photo_url': photoUrl,
      'nomUtilisateur': nomUtilisateur,
      'email': email,
      'motDePasse': motDePasse,
      'notificationPreferences': notificationPreferences,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountRecordDocumentEquality implements Equality<AccountRecord> {
  const AccountRecordDocumentEquality();

  @override
  bool equals(AccountRecord? e1, AccountRecord? e2) {
    return e1?.photoUrl == e2?.photoUrl &&
        e1?.nomUtilisateur == e2?.nomUtilisateur &&
        e1?.email == e2?.email &&
        e1?.motDePasse == e2?.motDePasse &&
        e1?.notificationPreferences == e2?.notificationPreferences;
  }

  @override
  int hash(AccountRecord? e) => const ListEquality().hash([
        e?.photoUrl,
        e?.nomUtilisateur,
        e?.email,
        e?.motDePasse,
        e?.notificationPreferences
      ]);

  @override
  bool isValidKey(Object? o) => o is AccountRecord;
}
