import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ReportReasonsRecord extends FirestoreRecord {
  ReportReasonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  void _initializeFields() {
    _reason = snapshotData['reason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reportReasons');

  static Stream<ReportReasonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportReasonsRecord.fromSnapshot(s));

  static Future<ReportReasonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportReasonsRecord.fromSnapshot(s));

  static ReportReasonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportReasonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportReasonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportReasonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportReasonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportReasonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportReasonsRecordData({
  String? reason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reason': reason,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportReasonsRecordDocumentEquality
    implements Equality<ReportReasonsRecord> {
  const ReportReasonsRecordDocumentEquality();

  @override
  bool equals(ReportReasonsRecord? e1, ReportReasonsRecord? e2) {
    return e1?.reason == e2?.reason;
  }

  @override
  int hash(ReportReasonsRecord? e) => const ListEquality().hash([e?.reason]);

  @override
  bool isValidKey(Object? o) => o is ReportReasonsRecord;
}
