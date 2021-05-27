import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:recipe/framework/data_source/network/abstraction/RecipeServices.dart';
import 'package:recipe/framework/data_source/network/util/ApiExceptions.dart';

class RecipeServiceImpl implements RecipeServices {
  final String baseUrl = "food2fork.ca";
  final String token = "Token 9c8b06d329136da358c2d00e76946b0111ce2c48";

  // Instance of http client to connection to the server
  Client httpClient = Client();

  @override
  Future<dynamic> get(int id) async {
    var responseJson;
    final endpoint = "get";
    var queryParameters = {'id': id};

    var uri = Uri.https(baseUrl, endpoint, queryParameters);

    try {
      final response = await httpClient.get(uri, headers: {
        HttpHeaders.authorizationHeader: token,
        HttpHeaders.contentTypeHeader: 'application/json'
      });

      responseJson = _returnResponse(response);
    } on SocketOption {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> search(int page, String query) async {
    var responseJson;
    final endpoint = "/api/recipe/search";
    var queryParameters = {'page': '$page', 'query': query};

    var uri = Uri.https(baseUrl, endpoint, queryParameters);

    try {
      final response = await httpClient.get(uri, headers: {
        HttpHeaders.authorizationHeader: token,
        HttpHeaders.contentTypeHeader: 'application/json'
      });

      responseJson = _returnResponse(response);
    } on SocketOption {
      throw FetchDataException('No internet connection');
    }

    return responseJson;
  }

  // Returns a Json object with the server response if status 200
  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        print(responseJson);
        return responseJson;

      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
