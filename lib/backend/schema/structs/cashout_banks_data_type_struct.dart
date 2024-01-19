// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CashoutBanksDataTypeStruct extends FFFirebaseStruct {
  CashoutBanksDataTypeStruct({
    String? rut,
    String? name,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rut = rut,
        _name = name,
        _id = id,
        super(firestoreUtilData);

  // "rut" field.
  String? _rut;
  String get rut => _rut ?? '';
  set rut(String? val) => _rut = val;
  bool hasRut() => _rut != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static CashoutBanksDataTypeStruct fromMap(Map<String, dynamic> data) =>
      CashoutBanksDataTypeStruct(
        rut: data['rut'] as String?,
        name: data['name'] as String?,
        id: data['id'] as String?,
      );

  static CashoutBanksDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? CashoutBanksDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rut': _rut,
        'name': _name,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rut': serializeParam(
          _rut,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static CashoutBanksDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CashoutBanksDataTypeStruct(
        rut: deserializeParam(
          data['rut'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CashoutBanksDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CashoutBanksDataTypeStruct &&
        rut == other.rut &&
        name == other.name &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([rut, name, id]);
}

CashoutBanksDataTypeStruct createCashoutBanksDataTypeStruct({
  String? rut,
  String? name,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CashoutBanksDataTypeStruct(
      rut: rut,
      name: name,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CashoutBanksDataTypeStruct? updateCashoutBanksDataTypeStruct(
  CashoutBanksDataTypeStruct? cashoutBanksDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cashoutBanksDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCashoutBanksDataTypeStructData(
  Map<String, dynamic> firestoreData,
  CashoutBanksDataTypeStruct? cashoutBanksDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cashoutBanksDataType == null) {
    return;
  }
  if (cashoutBanksDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cashoutBanksDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cashoutBanksDataTypeData =
      getCashoutBanksDataTypeFirestoreData(cashoutBanksDataType, forFieldValue);
  final nestedData =
      cashoutBanksDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      cashoutBanksDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCashoutBanksDataTypeFirestoreData(
  CashoutBanksDataTypeStruct? cashoutBanksDataType, [
  bool forFieldValue = false,
]) {
  if (cashoutBanksDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cashoutBanksDataType.toMap());

  // Add any Firestore field values
  cashoutBanksDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCashoutBanksDataTypeListFirestoreData(
  List<CashoutBanksDataTypeStruct>? cashoutBanksDataTypes,
) =>
    cashoutBanksDataTypes
        ?.map((e) => getCashoutBanksDataTypeFirestoreData(e, true))
        .toList() ??
    [];
