import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CountriesRecord extends FirestoreRecord {
  CountriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "europe" field.
  bool? _europe;
  bool get europe => _europe ?? false;
  bool hasEurope() => _europe != null;

  void _initializeFields() {
    _country = snapshotData['country'] as String?;
    _europe = snapshotData['europe'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('countries');

  static Stream<CountriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountriesRecord.fromSnapshot(s));

  static Future<CountriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountriesRecord.fromSnapshot(s));

  static CountriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountriesRecordData({
  String? country,
  bool? europe,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'country': country,
      'europe': europe,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountriesRecordDocumentEquality implements Equality<CountriesRecord> {
  const CountriesRecordDocumentEquality();

  @override
  bool equals(CountriesRecord? e1, CountriesRecord? e2) {
    return e1?.country == e2?.country && e1?.europe == e2?.europe;
  }

  @override
  int hash(CountriesRecord? e) =>
      const ListEquality().hash([e?.country, e?.europe]);

  @override
  bool isValidKey(Object? o) => o is CountriesRecord;
}
