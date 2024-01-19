import '/backend/schema/structs/index.dart';

class ValidateRegisterCloudFunctionCallResponse {
  ValidateRegisterCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
