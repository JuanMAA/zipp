import 'package:collection/collection.dart';

enum Input {
  text,
  number,
  multiple,
  textarea,
}

enum InputsEnum {
  chilean_document_id,
  chilean_phone,
  text,
  number,
}

enum UserAccountTypesEnum {
  account,
  service,
}

enum StatusTransactionsEnum {
  ERROR,
  ONE_CLICK_OK,
  ONE_CLICK_ERROR,
  WEBPAY_OK,
  WEBPAY_ERROR,
  SUCCESS,
  REJECTED,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Input):
      return Input.values.deserialize(value) as T?;
    case (InputsEnum):
      return InputsEnum.values.deserialize(value) as T?;
    case (UserAccountTypesEnum):
      return UserAccountTypesEnum.values.deserialize(value) as T?;
    case (StatusTransactionsEnum):
      return StatusTransactionsEnum.values.deserialize(value) as T?;
    default:
      return null;
  }
}
