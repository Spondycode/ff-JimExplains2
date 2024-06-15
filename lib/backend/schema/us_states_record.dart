import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UsStatesRecord extends FirestoreRecord {
  UsStatesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _state = snapshotData['state'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('us_states');

  static Stream<UsStatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsStatesRecord.fromSnapshot(s));

  static Future<UsStatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsStatesRecord.fromSnapshot(s));

  static UsStatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsStatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsStatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsStatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsStatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsStatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsStatesRecordData({
  String? code,
  String? state,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'state': state,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsStatesRecordDocumentEquality implements Equality<UsStatesRecord> {
  const UsStatesRecordDocumentEquality();

  @override
  bool equals(UsStatesRecord? e1, UsStatesRecord? e2) {
    return e1?.code == e2?.code && e1?.state == e2?.state;
  }

  @override
  int hash(UsStatesRecord? e) => const ListEquality().hash([e?.code, e?.state]);

  @override
  bool isValidKey(Object? o) => o is UsStatesRecord;
}
