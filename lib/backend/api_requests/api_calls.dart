import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ONE CLICK Group Code

class OneClickGroup {
  static String baseUrl =
      'https://api-dot-zippy-dev-payments.rj.r.appspot.com/';
  static Map<String, String> headers = {};
  static CreateClientSuscriptionCall createClientSuscriptionCall =
      CreateClientSuscriptionCall();
  static ClientCardsCall clientCardsCall = ClientCardsCall();
  static CreateTransactionCall createTransactionCall = CreateTransactionCall();
}

class CreateClientSuscriptionCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    String? rut = '',
    String? phone = '',
    String? address = '',
    String? country = '',
    String? region = '',
    String? city = '',
    String? postalCode = '',
    String? merchantId = '2022Gate-Express1e7w',
    String? userId = '',
    String? planName = 'PLAN GATE 0001',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "name": "${name}",
  "rut": "${rut}",
  "phone": "${phone}",
  "address": "${address}",
  "country": "${country}",
  "region": "${region}",
  "city": "${city}",
  "postal_code": "${postalCode}",
  "merchantId": "${merchantId}",
  "userId": "${userId}",
  "planName": "${planName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CREATE CLIENT  SUSCRIPTION',
      apiUrl: '${OneClickGroup.baseUrl}recordOneClick',
      callType: ApiCallType.POST,
      headers: {
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ClientCardsCall {
  Future<ApiCallResponse> call({
    String? merchantId = '2022Gate-Express1e7w',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "0001",
  "merchantId": "${merchantId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CLIENT CARDS',
      apiUrl: '${OneClickGroup.baseUrl}getCardClientOneClick',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }
}

class CreateTransactionCall {
  Future<ApiCallResponse> call({
    String? merchantId = '2022Gate-Express1e7w',
  }) async {
    final ffApiRequestBody = '''
{
  "commerceReqId": "10323r",
  "userId": "0001",
  "cardId": "sure6e1b1f7150595ed256a8",
  "email": "fmansilla@stratechcorp.com",
  "phone": "923232323",
  "merchantId": "${merchantId}",
  "rut": "184282100",
  "amount": "1000",
  "description": "Subscription payment",
  "metadata": {}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CREATE TRANSACTION',
      apiUrl: '${OneClickGroup.baseUrl}createTransactionOneClick',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwMzIiLCJhbW91bnQiOiIxMDAwIiwiaWF0IjoxNjk5NDc0OTgwfQ.oQ9uOz-Vr_zZkivsNDg6ZgZRIvhnqFHkyUCCKQyY5sr_gU03PWX_vs1SFF7Jb3v4s_AU7pHaPGTUxKEf1rR7Ls7q0XKhBhWc5h0jVlgP9B7wNMJoX_oTFuBNvU7ftnY_GS686O67lbpcKsfcymT-oxoM8A7UWPq5m2MuzJgWem3hg-hiS4Vbamj9Fxw72OaKmujlTuRshO2jMzxYzTHLezHMDbiYPdLpBf1ZX_TwEQdbmaFHcqwquXTWhRaY8BYq1aKz2l2C59OpadzAaa3pTBPNpfWDAwWidTIKe8jJOvEsV3dPkatEb3zx09mMZDbHq0f4Gt6Mucr1WSmEkQ1rTQ',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End ONE CLICK Group Code

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
