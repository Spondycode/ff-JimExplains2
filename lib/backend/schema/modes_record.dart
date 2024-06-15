import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ModesRecord extends FirestoreRecord {
  ModesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  bool hasMode() => _mode != null;

  void _initializeFields() {
    _mode = snapshotData['mode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('modes');

  static Stream<ModesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModesRecord.fromSnapshot(s));

  static Future<ModesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModesRecord.fromSnapshot(s));

  static ModesRecord fromSnapshot(DocumentSnapshot snapshot) => ModesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModesRecordData({
  String? mode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mode': mode,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModesRecordDocumentEquality implements Equality<ModesRecord> {
  const ModesRecordDocumentEquality();

  @override
  bool equals(ModesRecord? e1, ModesRecord? e2) {
    return e1?.mode == e2?.mode;
  }

  @override
  int hash(ModesRecord? e) => const ListEquality().hash([e?.mode]);

  @override
  bool isValidKey(Object? o) => o is ModesRecord;
}
