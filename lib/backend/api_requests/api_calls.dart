import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class QuoteAPICall {
  static Future<ApiCallResponse> call({
    List<String>? apiResult0pzList,
  }) async {
    final apiResult0pz = _serializeList(apiResult0pzList);

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
      headers: {
        'X-Api-Key': 'yCDCdm3P9KXalR9x8mMvoA==quO7YGlGAu1SGdoM',
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

class TextToImageCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
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

class ImdbCall {
  static Future<ApiCallResponse> call({
    List<String>? imdbResultList,
  }) async {
    final imdbResult = _serializeList(imdbResultList);

    return ApiManager.instance.makeApiCall(
      callName: 'Imdb',
      apiUrl: 'https://imdb-top-100-movies.p.rapidapi.com/',
      callType: ApiCallType.GET,
      headers: {
        'x-rapidapi-host': 'imdb-top-100-movies.p.rapidapi.com',
        'x-rapidapi-key': '95c52674e9msh60d14c805e7a063p13be69jsn76e98331e86c',
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

class DadJokeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'DadJoke',
      apiUrl: 'https://api.api-ninjas.com/v1/dadjokes',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': 'yCDCdm3P9KXalR9x8mMvoA==quO7YGlGAu1SGdoM',
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

class NewsCall {
  static Future<ApiCallResponse> call({
    List<String>? newsList,
  }) async {
    final news = _serializeList(newsList);

    return ApiManager.instance.makeApiCall(
      callName: 'news',
      apiUrl:
          'https://extract-news.p.rapidapi.com/v0/article?url=https%3A%2F%2Fwww.theverge.com%2F2020%2F4%2F17%2F21224728%2Fbill-gates-coronavirus-lies-5g-covid-19',
      callType: ApiCallType.GET,
      headers: {
        'x-rapidapi-host': 'extract-news.p.rapidapi.com',
        'x-rapidapi-key': '95c52674e9msh60d14c805e7a063p13be69jsn76e98331e86c',
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

class ChatbotCall {
  static Future<ApiCallResponse> call({
    String? kjfhf = 'hghghg',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'chatbot',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyD_yOiitx3QF520zmTUsT9NA7X7pc2auWE',
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
