import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtworkRecord extends FirestoreRecord {
  ArtworkRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "favorited_by" field.
  List<DocumentReference>? _favoritedBy;
  List<DocumentReference> get favoritedBy => _favoritedBy ?? const [];
  bool hasFavoritedBy() => _favoritedBy != null;

  // "favorite_count" field.
  int? _favoriteCount;
  int get favoriteCount => _favoriteCount ?? 0;
  bool hasFavoriteCount() => _favoriteCount != null;

  // "ImageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  bool hasImageURL() => _imageURL != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "sale_price" field.
  double? _salePrice;
  double get salePrice => _salePrice ?? 0.0;
  bool hasSalePrice() => _salePrice != null;

  // "sellerID" field.
  DocumentReference? _sellerID;
  DocumentReference? get sellerID => _sellerID;
  bool hasSellerID() => _sellerID != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "availability" field.
  bool? _availability;
  bool get availability => _availability ?? false;
  bool hasAvailability() => _availability != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _favoritedBy = getDataList(snapshotData['favorited_by']);
    _favoriteCount = castToType<int>(snapshotData['favorite_count']);
    _imageURL = snapshotData['ImageURL'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _rating = castToType<double>(snapshotData['rating']);
    _price = castToType<double>(snapshotData['price']);
    _salePrice = castToType<double>(snapshotData['sale_price']);
    _sellerID = snapshotData['sellerID'] as DocumentReference?;
    _category = snapshotData['category'] as String?;
    _availability = snapshotData['availability'] as bool?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _discount = castToType<double>(snapshotData['discount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Artwork');

  static Stream<ArtworkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtworkRecord.fromSnapshot(s));

  static Future<ArtworkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArtworkRecord.fromSnapshot(s));

  static ArtworkRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtworkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtworkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtworkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtworkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtworkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtworkRecordData({
  String? title,
  String? description,
  DateTime? createdTime,
  int? favoriteCount,
  String? imageURL,
  int? index,
  double? rating,
  double? price,
  double? salePrice,
  DocumentReference? sellerID,
  String? category,
  bool? availability,
  DocumentReference? createdBy,
  double? discount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'created_time': createdTime,
      'favorite_count': favoriteCount,
      'ImageURL': imageURL,
      'index': index,
      'rating': rating,
      'price': price,
      'sale_price': salePrice,
      'sellerID': sellerID,
      'category': category,
      'availability': availability,
      'createdBy': createdBy,
      'discount': discount,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtworkRecordDocumentEquality implements Equality<ArtworkRecord> {
  const ArtworkRecordDocumentEquality();

  @override
  bool equals(ArtworkRecord? e1, ArtworkRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.favoritedBy, e2?.favoritedBy) &&
        e1?.favoriteCount == e2?.favoriteCount &&
        e1?.imageURL == e2?.imageURL &&
        e1?.index == e2?.index &&
        e1?.rating == e2?.rating &&
        e1?.price == e2?.price &&
        e1?.salePrice == e2?.salePrice &&
        e1?.sellerID == e2?.sellerID &&
        e1?.category == e2?.category &&
        e1?.availability == e2?.availability &&
        e1?.createdBy == e2?.createdBy &&
        e1?.discount == e2?.discount;
  }

  @override
  int hash(ArtworkRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.createdTime,
        e?.favoritedBy,
        e?.favoriteCount,
        e?.imageURL,
        e?.index,
        e?.rating,
        e?.price,
        e?.salePrice,
        e?.sellerID,
        e?.category,
        e?.availability,
        e?.createdBy,
        e?.discount
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtworkRecord;
}
