import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NamesOfAllahRecord extends FirestoreRecord {
  NamesOfAllahRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "arabicName" field.
  String? _arabicName;
  String get arabicName => _arabicName ?? '';
  bool hasArabicName() => _arabicName != null;

  // "definition" field.
  String? _definition;
  String get definition => _definition ?? '';
  bool hasDefinition() => _definition != null;

  // "translation" field.
  String? _translation;
  String get translation => _translation ?? '';
  bool hasTranslation() => _translation != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "verseEnglish" field.
  String? _verseEnglish;
  String get verseEnglish => _verseEnglish ?? '';
  bool hasVerseEnglish() => _verseEnglish != null;

  // "verseArabic" field.
  String? _verseArabic;
  String get verseArabic => _verseArabic ?? '';
  bool hasVerseArabic() => _verseArabic != null;

  // "verse" field.
  String? _verse;
  String get verse => _verse ?? '';
  bool hasVerse() => _verse != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _arabicName = snapshotData['arabicName'] as String?;
    _definition = snapshotData['definition'] as String?;
    _translation = snapshotData['translation'] as String?;
    _image = snapshotData['image'] as String?;
    _verseEnglish = snapshotData['verseEnglish'] as String?;
    _verseArabic = snapshotData['verseArabic'] as String?;
    _verse = snapshotData['verse'] as String?;
    _audio = snapshotData['audio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('namesOfAllah');

  static Stream<NamesOfAllahRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NamesOfAllahRecord.fromSnapshot(s));

  static Future<NamesOfAllahRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NamesOfAllahRecord.fromSnapshot(s));

  static NamesOfAllahRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NamesOfAllahRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NamesOfAllahRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NamesOfAllahRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NamesOfAllahRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NamesOfAllahRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNamesOfAllahRecordData({
  String? name,
  int? order,
  String? arabicName,
  String? definition,
  String? translation,
  String? image,
  String? verseEnglish,
  String? verseArabic,
  String? verse,
  String? audio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'order': order,
      'arabicName': arabicName,
      'definition': definition,
      'translation': translation,
      'image': image,
      'verseEnglish': verseEnglish,
      'verseArabic': verseArabic,
      'verse': verse,
      'audio': audio,
    }.withoutNulls,
  );

  return firestoreData;
}

class NamesOfAllahRecordDocumentEquality
    implements Equality<NamesOfAllahRecord> {
  const NamesOfAllahRecordDocumentEquality();

  @override
  bool equals(NamesOfAllahRecord? e1, NamesOfAllahRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.order == e2?.order &&
        e1?.arabicName == e2?.arabicName &&
        e1?.definition == e2?.definition &&
        e1?.translation == e2?.translation &&
        e1?.image == e2?.image &&
        e1?.verseEnglish == e2?.verseEnglish &&
        e1?.verseArabic == e2?.verseArabic &&
        e1?.verse == e2?.verse &&
        e1?.audio == e2?.audio;
  }

  @override
  int hash(NamesOfAllahRecord? e) => const ListEquality().hash([
        e?.name,
        e?.order,
        e?.arabicName,
        e?.definition,
        e?.translation,
        e?.image,
        e?.verseEnglish,
        e?.verseArabic,
        e?.verse,
        e?.audio
      ]);

  @override
  bool isValidKey(Object? o) => o is NamesOfAllahRecord;
}
