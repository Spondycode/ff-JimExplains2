import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileRecord extends FirestoreRecord {
  ProfileRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  bool hasAvatar() => _avatar != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  bool hasNationality() => _nationality != null;

  // "camperStory" field.
  String? _camperStory;
  String get camperStory => _camperStory ?? '';
  bool hasCamperStory() => _camperStory != null;

  // "favCampsite" field.
  String? _favCampsite;
  String get favCampsite => _favCampsite ?? '';
  bool hasFavCampsite() => _favCampsite != null;

  // "camperMode" field.
  DocumentReference? _camperMode;
  DocumentReference? get camperMode => _camperMode;
  bool hasCamperMode() => _camperMode != null;

  // "profileImage" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  bool hasProfileImage() => _profileImage != null;

  // "plotReports" field.
  int? _plotReports;
  int get plotReports => _plotReports ?? 0;
  bool hasPlotReports() => _plotReports != null;

  // "numPlots" field.
  int? _numPlots;
  int get numPlots => _numPlots ?? 0;
  bool hasNumPlots() => _numPlots != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _avatar = snapshotData['avatar'] as String?;
    _displayName = snapshotData['displayName'] as String?;
    _created = snapshotData['created'] as DateTime?;
    _nationality = snapshotData['nationality'] as String?;
    _camperStory = snapshotData['camperStory'] as String?;
    _favCampsite = snapshotData['favCampsite'] as String?;
    _camperMode = snapshotData['camperMode'] as DocumentReference?;
    _profileImage = snapshotData['profileImage'] as String?;
    _plotReports = castToType<int>(snapshotData['plotReports']);
    _numPlots = castToType<int>(snapshotData['numPlots']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profile');

  static Stream<ProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileRecord.fromSnapshot(s));

  static Future<ProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileRecord.fromSnapshot(s));

  static ProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileRecordData({
  DocumentReference? user,
  String? avatar,
  String? displayName,
  DateTime? created,
  String? nationality,
  String? camperStory,
  String? favCampsite,
  DocumentReference? camperMode,
  String? profileImage,
  int? plotReports,
  int? numPlots,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'avatar': avatar,
      'displayName': displayName,
      'created': created,
      'nationality': nationality,
      'camperStory': camperStory,
      'favCampsite': favCampsite,
      'camperMode': camperMode,
      'profileImage': profileImage,
      'plotReports': plotReports,
      'numPlots': numPlots,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileRecordDocumentEquality implements Equality<ProfileRecord> {
  const ProfileRecordDocumentEquality();

  @override
  bool equals(ProfileRecord? e1, ProfileRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.avatar == e2?.avatar &&
        e1?.displayName == e2?.displayName &&
        e1?.created == e2?.created &&
        e1?.nationality == e2?.nationality &&
        e1?.camperStory == e2?.camperStory &&
        e1?.favCampsite == e2?.favCampsite &&
        e1?.camperMode == e2?.camperMode &&
        e1?.profileImage == e2?.profileImage &&
        e1?.plotReports == e2?.plotReports &&
        e1?.numPlots == e2?.numPlots;
  }

  @override
  int hash(ProfileRecord? e) => const ListEquality().hash([
        e?.user,
        e?.avatar,
        e?.displayName,
        e?.created,
        e?.nationality,
        e?.camperStory,
        e?.favCampsite,
        e?.camperMode,
        e?.profileImage,
        e?.plotReports,
        e?.numPlots
      ]);

  @override
  bool isValidKey(Object? o) => o is ProfileRecord;
}
