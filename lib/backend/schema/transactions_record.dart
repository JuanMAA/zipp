import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "recipient_account_type" field.
  String? _recipientAccountType;
  String get recipientAccountType => _recipientAccountType ?? '';
  bool hasRecipientAccountType() => _recipientAccountType != null;

  // "recipient_account_number" field.
  String? _recipientAccountNumber;
  String get recipientAccountNumber => _recipientAccountNumber ?? '';
  bool hasRecipientAccountNumber() => _recipientAccountNumber != null;

  // "recipient_bank_id" field.
  String? _recipientBankId;
  String get recipientBankId => _recipientBankId ?? '';
  bool hasRecipientBankId() => _recipientBankId != null;

  // "total_amount" field.
  String? _totalAmount;
  String get totalAmount => _totalAmount ?? '';
  bool hasTotalAmount() => _totalAmount != null;

  // "total_commission" field.
  String? _totalCommission;
  String get totalCommission => _totalCommission ?? '';
  bool hasTotalCommission() => _totalCommission != null;

  // "percent_commission" field.
  String? _percentCommission;
  String get percentCommission => _percentCommission ?? '';
  bool hasPercentCommission() => _percentCommission != null;

  // "base_amount" field.
  String? _baseAmount;
  String get baseAmount => _baseAmount ?? '';
  bool hasBaseAmount() => _baseAmount != null;

  // "commission" field.
  String? _commission;
  String get commission => _commission ?? '';
  bool hasCommission() => _commission != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _recipientAccountType = snapshotData['recipient_account_type'] as String?;
    _recipientAccountNumber =
        snapshotData['recipient_account_number'] as String?;
    _recipientBankId = snapshotData['recipient_bank_id'] as String?;
    _totalAmount = snapshotData['total_amount'] as String?;
    _totalCommission = snapshotData['total_commission'] as String?;
    _percentCommission = snapshotData['percent_commission'] as String?;
    _baseAmount = snapshotData['base_amount'] as String?;
    _commission = snapshotData['commission'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference? user,
  String? status,
  DateTime? updateDate,
  DateTime? createDate,
  String? description,
  String? recipientAccountType,
  String? recipientAccountNumber,
  String? recipientBankId,
  String? totalAmount,
  String? totalCommission,
  String? percentCommission,
  String? baseAmount,
  String? commission,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'status': status,
      'update_date': updateDate,
      'create_date': createDate,
      'description': description,
      'recipient_account_type': recipientAccountType,
      'recipient_account_number': recipientAccountNumber,
      'recipient_bank_id': recipientBankId,
      'total_amount': totalAmount,
      'total_commission': totalCommission,
      'percent_commission': percentCommission,
      'base_amount': baseAmount,
      'commission': commission,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.status == e2?.status &&
        e1?.updateDate == e2?.updateDate &&
        e1?.createDate == e2?.createDate &&
        e1?.description == e2?.description &&
        e1?.recipientAccountType == e2?.recipientAccountType &&
        e1?.recipientAccountNumber == e2?.recipientAccountNumber &&
        e1?.recipientBankId == e2?.recipientBankId &&
        e1?.totalAmount == e2?.totalAmount &&
        e1?.totalCommission == e2?.totalCommission &&
        e1?.percentCommission == e2?.percentCommission &&
        e1?.baseAmount == e2?.baseAmount &&
        e1?.commission == e2?.commission;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.status,
        e?.updateDate,
        e?.createDate,
        e?.description,
        e?.recipientAccountType,
        e?.recipientAccountNumber,
        e?.recipientBankId,
        e?.totalAmount,
        e?.totalCommission,
        e?.percentCommission,
        e?.baseAmount,
        e?.commission
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
