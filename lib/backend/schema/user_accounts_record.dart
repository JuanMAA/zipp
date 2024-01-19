import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAccountsRecord extends FirestoreRecord {
  UserAccountsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "recipient_document_id" field.
  String? _recipientDocumentId;
  String get recipientDocumentId => _recipientDocumentId ?? '';
  bool hasRecipientDocumentId() => _recipientDocumentId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "account_number" field.
  int? _accountNumber;
  int get accountNumber => _accountNumber ?? 0;
  bool hasAccountNumber() => _accountNumber != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "account" field.
  DocumentReference? _account;
  DocumentReference? get account => _account;
  bool hasAccount() => _account != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "data" field.
  List<InputDataStruct>? _data;
  List<InputDataStruct> get data => _data ?? const [];
  bool hasData() => _data != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "type_account_id" field.
  String? _typeAccountId;
  String get typeAccountId => _typeAccountId ?? '';
  bool hasTypeAccountId() => _typeAccountId != null;

  // "bank_id" field.
  String? _bankId;
  String get bankId => _bankId ?? '';
  bool hasBankId() => _bankId != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  bool hasMonth() => _month != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  void _initializeFields() {
    _recipientDocumentId = snapshotData['recipient_document_id'] as String?;
    _name = snapshotData['name'] as String?;
    _accountNumber = castToType<int>(snapshotData['account_number']);
    _user = snapshotData['user'] as DocumentReference?;
    _account = snapshotData['account'] as DocumentReference?;
    _amount = castToType<int>(snapshotData['amount']);
    _currency = snapshotData['currency'] as String?;
    _type = snapshotData['type'] as String?;
    _data = getStructList(
      snapshotData['data'],
      InputDataStruct.fromMap,
    );
    _email = snapshotData['email'] as String?;
    _typeAccountId = snapshotData['type_account_id'] as String?;
    _bankId = snapshotData['bank_id'] as String?;
    _bank = snapshotData['bank'] as String?;
    _month = snapshotData['month'] as String?;
    _year = snapshotData['year'] as String?;
    _comment = snapshotData['comment'] as String?;
    _deleted = snapshotData['deleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAccounts');

  static Stream<UserAccountsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAccountsRecord.fromSnapshot(s));

  static Future<UserAccountsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAccountsRecord.fromSnapshot(s));

  static UserAccountsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAccountsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAccountsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAccountsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAccountsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAccountsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAccountsRecordData({
  String? recipientDocumentId,
  String? name,
  int? accountNumber,
  DocumentReference? user,
  DocumentReference? account,
  int? amount,
  String? currency,
  String? type,
  String? email,
  String? typeAccountId,
  String? bankId,
  String? bank,
  String? month,
  String? year,
  String? comment,
  bool? deleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recipient_document_id': recipientDocumentId,
      'name': name,
      'account_number': accountNumber,
      'user': user,
      'account': account,
      'amount': amount,
      'currency': currency,
      'type': type,
      'email': email,
      'type_account_id': typeAccountId,
      'bank_id': bankId,
      'bank': bank,
      'month': month,
      'year': year,
      'comment': comment,
      'deleted': deleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAccountsRecordDocumentEquality
    implements Equality<UserAccountsRecord> {
  const UserAccountsRecordDocumentEquality();

  @override
  bool equals(UserAccountsRecord? e1, UserAccountsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.recipientDocumentId == e2?.recipientDocumentId &&
        e1?.name == e2?.name &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.user == e2?.user &&
        e1?.account == e2?.account &&
        e1?.amount == e2?.amount &&
        e1?.currency == e2?.currency &&
        e1?.type == e2?.type &&
        listEquality.equals(e1?.data, e2?.data) &&
        e1?.email == e2?.email &&
        e1?.typeAccountId == e2?.typeAccountId &&
        e1?.bankId == e2?.bankId &&
        e1?.bank == e2?.bank &&
        e1?.month == e2?.month &&
        e1?.year == e2?.year &&
        e1?.comment == e2?.comment &&
        e1?.deleted == e2?.deleted;
  }

  @override
  int hash(UserAccountsRecord? e) => const ListEquality().hash([
        e?.recipientDocumentId,
        e?.name,
        e?.accountNumber,
        e?.user,
        e?.account,
        e?.amount,
        e?.currency,
        e?.type,
        e?.data,
        e?.email,
        e?.typeAccountId,
        e?.bankId,
        e?.bank,
        e?.month,
        e?.year,
        e?.comment,
        e?.deleted
      ]);

  @override
  bool isValidKey(Object? o) => o is UserAccountsRecord;
}
