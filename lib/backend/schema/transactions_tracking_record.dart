import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsTrackingRecord extends FirestoreRecord {
  TransactionsTrackingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "transaction_id" field.
  DocumentReference? _transactionId;
  DocumentReference? get transactionId => _transactionId;
  bool hasTransactionId() => _transactionId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "additional_message" field.
  String? _additionalMessage;
  String get additionalMessage => _additionalMessage ?? '';
  bool hasAdditionalMessage() => _additionalMessage != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _transactionId = snapshotData['transaction_id'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _additionalMessage = snapshotData['additional_message'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TransactionsTracking');

  static Stream<TransactionsTrackingRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsTrackingRecord.fromSnapshot(s));

  static Future<TransactionsTrackingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TransactionsTrackingRecord.fromSnapshot(s));

  static TransactionsTrackingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsTrackingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsTrackingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsTrackingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsTrackingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsTrackingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsTrackingRecordData({
  DocumentReference? transactionId,
  String? status,
  String? additionalMessage,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'transaction_id': transactionId,
      'status': status,
      'additional_message': additionalMessage,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsTrackingRecordDocumentEquality
    implements Equality<TransactionsTrackingRecord> {
  const TransactionsTrackingRecordDocumentEquality();

  @override
  bool equals(TransactionsTrackingRecord? e1, TransactionsTrackingRecord? e2) {
    return e1?.transactionId == e2?.transactionId &&
        e1?.status == e2?.status &&
        e1?.additionalMessage == e2?.additionalMessage &&
        e1?.date == e2?.date;
  }

  @override
  int hash(TransactionsTrackingRecord? e) => const ListEquality()
      .hash([e?.transactionId, e?.status, e?.additionalMessage, e?.date]);

  @override
  bool isValidKey(Object? o) => o is TransactionsTrackingRecord;
}
