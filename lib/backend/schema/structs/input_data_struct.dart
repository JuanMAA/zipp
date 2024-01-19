// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InputDataStruct extends FFFirebaseStruct {
  InputDataStruct({
    int? id,
    String? name,
    String? value,
    Input? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _value = value,
        _type = type,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;
  bool hasValue() => _value != null;

  // "type" field.
  Input? _type;
  Input get type => _type ?? Input.text;
  set type(Input? val) => _type = val;
  bool hasType() => _type != null;

  static InputDataStruct fromMap(Map<String, dynamic> data) => InputDataStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        value: data['value'] as String?,
        type: deserializeEnum<Input>(data['type']),
      );

  static InputDataStruct? maybeFromMap(dynamic data) => data is Map
      ? InputDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'value': _value,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static InputDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      InputDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<Input>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'InputDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InputDataStruct &&
        id == other.id &&
        name == other.name &&
        value == other.value &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, value, type]);
}

InputDataStruct createInputDataStruct({
  int? id,
  String? name,
  String? value,
  Input? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InputDataStruct(
      id: id,
      name: name,
      value: value,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InputDataStruct? updateInputDataStruct(
  InputDataStruct? inputData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    inputData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInputDataStructData(
  Map<String, dynamic> firestoreData,
  InputDataStruct? inputData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (inputData == null) {
    return;
  }
  if (inputData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && inputData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final inputDataData = getInputDataFirestoreData(inputData, forFieldValue);
  final nestedData = inputDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = inputData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInputDataFirestoreData(
  InputDataStruct? inputData, [
  bool forFieldValue = false,
]) {
  if (inputData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(inputData.toMap());

  // Add any Firestore field values
  inputData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInputDataListFirestoreData(
  List<InputDataStruct>? inputDatas,
) =>
    inputDatas?.map((e) => getInputDataFirestoreData(e, true)).toList() ?? [];
