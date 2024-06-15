import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "poster" field.
  DocumentReference? _poster;
  DocumentReference? get poster => _poster;
  bool hasPoster() => _poster != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "comments" field.
  DocumentReference? _comments;
  DocumentReference? get comments => _comments;
  bool hasComments() => _comments != null;

  // "what3words" field.
  String? _what3words;
  String get what3words => _what3words ?? '';
  bool hasWhat3words() => _what3words != null;

  // "campsite" field.
  String? _campsite;
  String get campsite => _campsite ?? '';
  bool hasCampsite() => _campsite != null;

  // "approved" field.
  bool? _approved;
  bool get approved => _approved ?? false;
  bool hasApproved() => _approved != null;

  // "reportedBy" field.
  DocumentReference? _reportedBy;
  DocumentReference? get reportedBy => _reportedBy;
  bool hasReportedBy() => _reportedBy != null;

  // "reportedDate" field.
  DateTime? _reportedDate;
  DateTime? get reportedDate => _reportedDate;
  bool hasReportedDate() => _reportedDate != null;

  // "plotID" field.
  String? _plotID;
  String get plotID => _plotID ?? '';
  bool hasPlotID() => _plotID != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "categories" field.
  String? _categories;
  String get categories => _categories ?? '';
  bool hasCategories() => _categories != null;

  // "seasons" field.
  String? _seasons;
  String get seasons => _seasons ?? '';
  bool hasSeasons() => _seasons != null;

  // "reportedReason" field.
  String? _reportedReason;
  String get reportedReason => _reportedReason ?? '';
  bool hasReportedReason() => _reportedReason != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  void _initializeFields() {
    _topic = snapshotData['topic'] as String?;
    _poster = snapshotData['poster'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _comments = snapshotData['comments'] as DocumentReference?;
    _what3words = snapshotData['what3words'] as String?;
    _campsite = snapshotData['campsite'] as String?;
    _approved = snapshotData['approved'] as bool?;
    _reportedBy = snapshotData['reportedBy'] as DocumentReference?;
    _reportedDate = snapshotData['reportedDate'] as DateTime?;
    _plotID = snapshotData['plotID'] as String?;
    _title = snapshotData['title'] as String?;
    _price = snapshotData['price'] as String?;
    _categories = snapshotData['categories'] as String?;
    _seasons = snapshotData['seasons'] as String?;
    _reportedReason = snapshotData['reportedReason'] as String?;
    _country = snapshotData['country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? topic,
  DocumentReference? poster,
  String? image,
  DateTime? date,
  DocumentReference? comments,
  String? what3words,
  String? campsite,
  bool? approved,
  DocumentReference? reportedBy,
  DateTime? reportedDate,
  String? plotID,
  String? title,
  String? price,
  String? categories,
  String? seasons,
  String? reportedReason,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'topic': topic,
      'poster': poster,
      'image': image,
      'date': date,
      'comments': comments,
      'what3words': what3words,
      'campsite': campsite,
      'approved': approved,
      'reportedBy': reportedBy,
      'reportedDate': reportedDate,
      'plotID': plotID,
      'title': title,
      'price': price,
      'categories': categories,
      'seasons': seasons,
      'reportedReason': reportedReason,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.topic == e2?.topic &&
        e1?.poster == e2?.poster &&
        e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.comments == e2?.comments &&
        e1?.what3words == e2?.what3words &&
        e1?.campsite == e2?.campsite &&
        e1?.approved == e2?.approved &&
        e1?.reportedBy == e2?.reportedBy &&
        e1?.reportedDate == e2?.reportedDate &&
        e1?.plotID == e2?.plotID &&
        e1?.title == e2?.title &&
        e1?.price == e2?.price &&
        e1?.categories == e2?.categories &&
        e1?.seasons == e2?.seasons &&
        e1?.reportedReason == e2?.reportedReason &&
        e1?.country == e2?.country;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.topic,
        e?.poster,
        e?.image,
        e?.date,
        e?.likes,
        e?.comments,
        e?.what3words,
        e?.campsite,
        e?.approved,
        e?.reportedBy,
        e?.reportedDate,
        e?.plotID,
        e?.title,
        e?.price,
        e?.categories,
        e?.seasons,
        e?.reportedReason,
        e?.country
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
