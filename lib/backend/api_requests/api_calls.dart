import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'PrivateApiCallV2';

/// Start ONE CLICK Group Code

class OneClickGroup {
  static CreateClientSubscCall createClientSubscCall = CreateClientSubscCall();
  static ClientCardsCall clientCardsCall = ClientCardsCall();
  static CreateTransactionCall createTransactionCall = CreateTransactionCall();
  static GetBanksCall getBanksCall = GetBanksCall();
}

class CreateClientSubscCall {
  Future<ApiCallResponse> call({
    String? planName = 'PLAN ZIPP 0001',
    String? merchantId = '2024Zipp2A8f',
    String? city = '-',
    String? postalCode = '8320000',
    String? country = '-',
    String? region = '-',
    String? address = '-',
    String? userId = '',
    String? commerceReqId = '',
    dynamic? metadataJson,
    String? description = '',
    String? amount = '0',
    String? email = '',
    String? name = '',
    String? rut = '',
    String? phone = '-',
    String? cardId = '',
  }) async {
    final metadata = _serializeJson(metadataJson);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateClientSubscCall',
        'variables': {
          'planName': planName,
          'merchantId': merchantId,
          'city': city,
          'postalCode': postalCode,
          'country': country,
          'region': region,
          'address': address,
          'userId': userId,
          'commerceReqId': commerceReqId,
          'metadata': metadata,
          'description': description,
          'amount': amount,
          'email': email,
          'name': name,
          'rut': rut,
          'phone': phone,
          'cardId': cardId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ClientCardsCall {
  Future<ApiCallResponse> call({
    String? planName = 'PLAN ZIPP 0001',
    String? merchantId = '2024Zipp2A8f',
    String? city = '-',
    String? postalCode = '8320000',
    String? country = '-',
    String? region = '-',
    String? address = '-',
    String? userId = '',
    String? commerceReqId = '',
    dynamic? metadataJson,
    String? description = '',
    String? amount = '0',
    String? email = '',
    String? name = '',
    String? rut = '',
    String? phone = '-',
    String? cardId = '',
  }) async {
    final metadata = _serializeJson(metadataJson);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ClientCardsCall',
        'variables': {
          'planName': planName,
          'merchantId': merchantId,
          'city': city,
          'postalCode': postalCode,
          'country': country,
          'region': region,
          'address': address,
          'userId': userId,
          'commerceReqId': commerceReqId,
          'metadata': metadata,
          'description': description,
          'amount': amount,
          'email': email,
          'name': name,
          'rut': rut,
          'phone': phone,
          'cardId': cardId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateTransactionCall {
  Future<ApiCallResponse> call({
    String? planName = 'PLAN ZIPP 0001',
    String? merchantId = '2024Zipp2A8f',
    String? city = '-',
    String? postalCode = '8320000',
    String? country = '-',
    String? region = '-',
    String? address = '-',
    String? userId = '',
    String? commerceReqId = '',
    dynamic? metadataJson,
    String? description = '',
    String? amount = '0',
    String? email = '',
    String? name = '',
    String? rut = '',
    String? phone = '-',
    String? cardId = '',
  }) async {
    final metadata = _serializeJson(metadataJson);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateTransactionCall',
        'variables': {
          'planName': planName,
          'merchantId': merchantId,
          'city': city,
          'postalCode': postalCode,
          'country': country,
          'region': region,
          'address': address,
          'userId': userId,
          'commerceReqId': commerceReqId,
          'metadata': metadata,
          'description': description,
          'amount': amount,
          'email': email,
          'name': name,
          'rut': rut,
          'phone': phone,
          'cardId': cardId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetBanksCall {
  Future<ApiCallResponse> call({
    String? planName = 'PLAN ZIPP 0001',
    String? merchantId = '2024Zipp2A8f',
    String? city = '-',
    String? postalCode = '8320000',
    String? country = '-',
    String? region = '-',
    String? address = '-',
    String? userId = '',
    String? commerceReqId = '',
    dynamic? metadataJson,
    String? description = '',
    String? amount = '0',
    String? email = '',
    String? name = '',
    String? rut = '',
    String? phone = '-',
    String? cardId = '',
  }) async {
    final metadata = _serializeJson(metadataJson);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetBanksCall',
        'variables': {
          'planName': planName,
          'merchantId': merchantId,
          'city': city,
          'postalCode': postalCode,
          'country': country,
          'region': region,
          'address': address,
          'userId': userId,
          'commerceReqId': commerceReqId,
          'metadata': metadata,
          'description': description,
          'amount': amount,
          'email': email,
          'name': name,
          'rut': rut,
          'phone': phone,
          'cardId': cardId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End ONE CLICK Group Code

/// Start ZIPP Group Code

class ZippGroup {
  static String baseUrl =
      'https://us-central1-test-zippypay.cloudfunctions.net';
  static Map<String, String> headers = {
    'Authorization': '[auth_token]',
  };
  static RegisterPayCall registerPayCall = RegisterPayCall();
  static ValidateFormsCall validateFormsCall = ValidateFormsCall();
}

class RegisterPayCall {
  Future<ApiCallResponse> call({
    String? userAccountId = '',
    String? cardId = 'sure8b477347471a80c55098',
    int? amount = 30000,
    String? description = 'Test',
    String? authToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RegisterPayCall',
        'variables': {
          'userAccountId': userAccountId,
          'cardId': cardId,
          'amount': amount,
          'description': description,
          'authToken': authToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  dynamic? ok(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class ValidateFormsCall {
  Future<ApiCallResponse> call({
    String? documentId = '',
    String? email = '',
    String? cardId = 'sure8b477347471a80c55098',
    int? amount = 30000,
    String? description = 'Test',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "document_id": "${documentId}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VALIDATE FORMS',
      apiUrl: '${ZippGroup.baseUrl}/function-5',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ZIPP Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
