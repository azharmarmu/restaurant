import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://maps.googleapis.com/maps/api/place',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<dynamic> get({String? keyword}) async {
    Map<String, dynamic> query = Map();
    query['location'] = '47.6204,-122.3491';
    query['radius'] = '2500';
    query['type'] = 'restaurant';
    query['key'] = 'AIzaSyDxVclNSQGB5WHAYQiHK-VxYKJelZ_9mjk';
    if (keyword != null) {
      query['keyword'] = keyword;
    }
    dynamic response;
    try {
      response = await _dio.get(
        '/nearbysearch/json',
        queryParameters: query,
        options: Options(
          method: 'GET',
        ),
      );
    } catch (e) {
      print('try-catch: $e');
      throw Exception(e);
    }

    if (response?.statusCode == 200) {
      print('200');
      return response;
    } else if (response?.statusCode == 401) {
      print('401');
      throw Exception(response.toString());
    } else {
      print('Exception');
      throw Exception(response.statusMessage);
    }
  }
}
