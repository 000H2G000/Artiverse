import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class QuoteAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'QuoteAPI',
      apiUrl: 'https://api.api-ninjas.com/v1/quotes',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'HyaOxypKlDvwY2XKbL+RgA==bOlQd9XoyTpYNaRN',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? quote(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].quote''',
      ));
  static String? author(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].author''',
      ));
  static String? category(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].category''',
      ));
}

class UploadImageCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'uploadImage',
      apiUrl:
          'https://api.imgbb.com/1/upload?key=0afaf752a82a7e85fc0cb20ecd5eb775',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imageURL(dynamic response) => getJsonField(
        response,
        r'''$.data.url''',
      );
}

class MapApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'mapApi',
      apiUrl: '64a82625-9706-4c4c-b4b7-16fee7d535eb',
      callType: ApiCallType.GET,
      headers: {
        'key': 'CMMKzQAWvB4VIXBjAB3SErI0GMT8FRH5',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MapNinjaApiCall {
  static Future<ApiCallResponse> call({
    String? city = 'France',
    String? country = 'Paris',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'mapNinjaApi',
      apiUrl:
          'https://api.api-ninjas.com/v1/geocoding?city=${city}&country=${country}',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'HyaOxypKlDvwY2XKbL+RgA==bOlQd9XoyTpYNaRN',
      },
      params: {
        'city': city,
        'country': country,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$[*].latitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? lng(dynamic response) => (getJsonField(
        response,
        r'''$[*].longitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class RandomFactsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'RandomFacts',
      apiUrl: 'https://api.api-ninjas.com/v1/facts',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TextToImageCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'TextToImage',
      apiUrl: 'https://api.api-ninjas.com/v1/imagetotext',
      callType: ApiCallType.POST,
      headers: {
        'X-Api-Key': 'yCDCdm3P9KXalR9x8mMvoA==quO7YGlGAu1SGdoM',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
