import 'dart:convert';
import 'dart:io';
import 'package:gymgeni/cachemanager/cache_manager.dart';
import 'package:gymgeni/data/apiendpoint.dart';
import 'package:http/http.dart' as http;
import '../../data/base_client.dart';
import '../utils/errorstrings.dart';

class Networking with CacheManager implements BaseClient {
  @override
  Future getData({required String url}) async {
    dynamic jsonGetResposne;
    String? token;
    token = checkingTokenExpireOrNot();
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': ApiEndPoint.contentType,
          'Authorization': "Bearer $token",
        },
      );

      jsonGetResposne = await fetchResponse(response);
    } on SocketException {
      return Future.error(internetError);
    } on HttpException {
      return Future.error(httpError);
    } on Exception catch (e) {
      return Future.error(e);
    }
    return jsonGetResposne;
  }

  @override
  Future postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    dynamic jsonPostResponse;
    String? token;
    token = checkingTokenExpireOrNot();
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': ApiEndPoint.accept,
          'Content-Type': ApiEndPoint.contentType,
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(body),
      );

      jsonPostResponse = await fetchResponse(response);
    } on SocketException {
      return Future.error(internetError);
    } on HttpException {
      return Future.error(httpError);
    } on Exception catch (e) {
      return Future.error(e);
    }
    return jsonPostResponse;
  }

  Future<dynamic> fetchResponse(http.Response response) async {
    dynamic data;
    switch (response.statusCode) {
      case 200:
        data = jsonDecode(response.body);
        break;
      case 201:
        data = jsonDecode(response.body);
        break;
      case 400:
        data = jsonDecode(response.body);
        break;
      case 401:
        data = jsonDecode(response.body);
        break;
      case 404:
        data = jsonDecode(response.body);
        break;
      case 500:
        data = jsonDecode(response.body);
        break;
      default:
        {
          data = somethingWentWrong;
        }
    }
    return data;
  }

  String? checkingTokenExpireOrNot() {
    var token = retriveToken();
    return token;
  }
}
