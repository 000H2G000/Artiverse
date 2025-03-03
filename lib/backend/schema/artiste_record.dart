import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtisteRecord extends FirestoreRecord {
  ArtisteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "idArtiste" field.
  int? _idArtiste;
  int get idArtiste => _idArtiste ?? 0;
  bool hasIdArtiste() => _idArtiste != null;

  // "idCompte" field.
  int? _idCompte;
  int get idCompte => _idCompte ?? 0;
  bool hasIdCompte() => _idCompte != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "nombreFollowers" field.
  int? _nombreFollowers;
  int get nombreFollowers => _nombreFollowers ?? 0;
  bool hasNombreFollowers() => _nombreFollowers != null;

  // "nombreFollowing" field.
  int? _nombreFollowing;
  int get nombreFollowing => _nombreFollowing ?? 0;
  bool hasNombreFollowing() => _nombreFollowing != null;

  void _initializeFields() {
    _idArtiste = castToType<int>(snapshotData['idArtiste']);
    _idCompte = castToType<int>(snapshotData['idCompte']);
    _bio = snapshotData['bio'] as String?;
    _nombreFollowers = castToType<int>(snapshotData['nombreFollowers']);
    _nombreFollowing = castToType<int>(snapshotData['nombreFollowing']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Artiste');

  static Stream<ArtisteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtisteRecord.fromSnapshot(s));

  static Future<ArtisteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtisteRecord.fromSnapshot(s));

  static ArtisteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtisteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtisteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtisteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtisteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtisteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtisteRecordData({
  int? idArtiste,
  int? idCompte,
  String? bio,
  int? nombreFollowers,
  int? nombreFollowing,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idArtiste': idArtiste,
      'idCompte': idCompte,
      'bio': bio,
      'nombreFollowers': nombreFollowers,
      'nombreFollowing': nombreFollowing,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtisteRecordDocumentEquality implements Equality<ArtisteRecord> {
  const ArtisteRecordDocumentEquality();

  @override
  bool equals(ArtisteRecord? e1, ArtisteRecord? e2) {
    return e1?.idArtiste == e2?.idArtiste &&
        e1?.idCompte == e2?.idCompte &&
        e1?.bio == e2?.bio &&
        e1?.nombreFollowers == e2?.nombreFollowers &&
        e1?.nombreFollowing == e2?.nombreFollowing;
  }

  @override
  int hash(ArtisteRecord? e) => const ListEquality().hash([
        e?.idArtiste,
        e?.idCompte,
        e?.bio,
        e?.nombreFollowers,
        e?.nombreFollowing
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtisteRecord;
}
