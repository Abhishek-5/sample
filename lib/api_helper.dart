import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_config.dart';
import 'api_exception.dart';

class ApiBaseHelper {


  Future<dynamic> getApiCall(String url) async {
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse(BASE_URL + url), headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson[0];
  }

  dynamic _returnResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}