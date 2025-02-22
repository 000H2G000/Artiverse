import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotesRecord extends FirestoreRecord {
  QuotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quote" field.
  String? _quote;
  String get quote => _quote ?? '';
  bool hasQuote() => _quote != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "cath" field.
  String? _cath;
  String get cath => _cath ?? '';
  bool hasCath() => _cath != null;

  void _initializeFields() {
    _quote = snapshotData['quote'] as String?;
    _author = snapshotData['author'] as String?;
    _cath = snapshotData['cath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Quotes');

  static Stream<QuotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuotesRecord.fromSnapshot(s));

  static Future<QuotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuotesRecord.fromSnapshot(s));

  static QuotesRecord fromSnapshot(DocumentSnapshot snapshot) => QuotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuotesRecordData({
  String? quote,
  String? author,
  String? cath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quote': quote,
      'author': author,
      'cath': cath,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuotesRecordDocumentEquality implements Equality<QuotesRecord> {
  const QuotesRecordDocumentEquality();

  @override
  bool equals(QuotesRecord? e1, QuotesRecord? e2) {
    return e1?.quote == e2?.quote &&
        e1?.author == e2?.author &&
        e1?.cath == e2?.cath;
  }

  @override
  int hash(QuotesRecord? e) =>
      const ListEquality().hash([e?.quote, e?.author, e?.cath]);

  @override
  bool isValidKey(Object? o) => o is QuotesRecord;
}
