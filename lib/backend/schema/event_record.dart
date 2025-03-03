import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRecord extends FirestoreRecord {
  EventRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "StartDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "EndDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "MaxGuestsNumber" field.
  int? _maxGuestsNumber;
  int get maxGuestsNumber => _maxGuestsNumber ?? 0;
  bool hasMaxGuestsNumber() => _maxGuestsNumber != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "participants" field.
  int? _participants;
  int get participants => _participants ?? 0;
  bool hasParticipants() => _participants != null;

  // "userParticipants" field.
  List<DocumentReference>? _userParticipants;
  List<DocumentReference> get userParticipants => _userParticipants ?? const [];
  bool hasUserParticipants() => _userParticipants != null;

  // "exactLocation" field.
  LatLng? _exactLocation;
  LatLng? get exactLocation => _exactLocation;
  bool hasExactLocation() => _exactLocation != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _description = snapshotData['Description'] as String?;
    _location = snapshotData['Location'] as String?;
    _image = snapshotData['Image'] as String?;
    _startDate = snapshotData['StartDate'] as DateTime?;
    _endDate = snapshotData['EndDate'] as DateTime?;
    _maxGuestsNumber = castToType<int>(snapshotData['MaxGuestsNumber']);
    _category = snapshotData['Category'] as String?;
    _price = castToType<double>(snapshotData['Price']);
    _participants = castToType<int>(snapshotData['participants']);
    _userParticipants = getDataList(snapshotData['userParticipants']);
    _exactLocation = snapshotData['exactLocation'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Event');

  static Stream<EventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventRecord.fromSnapshot(s));

  static Future<EventRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventRecord.fromSnapshot(s));

  static EventRecord fromSnapshot(DocumentSnapshot snapshot) => EventRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventRecordData({
  String? name,
  String? description,
  String? location,
  String? image,
  DateTime? startDate,
  DateTime? endDate,
  int? maxGuestsNumber,
  String? category,
  double? price,
  int? participants,
  LatLng? exactLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Description': description,
      'Location': location,
      'Image': image,
      'StartDate': startDate,
      'EndDate': endDate,
      'MaxGuestsNumber': maxGuestsNumber,
      'Category': category,
      'Price': price,
      'participants': participants,
      'exactLocation': exactLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventRecordDocumentEquality implements Equality<EventRecord> {
  const EventRecordDocumentEquality();

  @override
  bool equals(EventRecord? e1, EventRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.location == e2?.location &&
        e1?.image == e2?.image &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.maxGuestsNumber == e2?.maxGuestsNumber &&
        e1?.category == e2?.category &&
        e1?.price == e2?.price &&
        e1?.participants == e2?.participants &&
        listEquality.equals(e1?.userParticipants, e2?.userParticipants) &&
        e1?.exactLocation == e2?.exactLocation;
  }

  @override
  int hash(EventRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.location,
        e?.image,
        e?.startDate,
        e?.endDate,
        e?.maxGuestsNumber,
        e?.category,
        e?.price,
        e?.participants,
        e?.userParticipants,
        e?.exactLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is EventRecord;
}
