import 'package:dio/dio.dart';

class ApiServes {
  final _baseUrl = 'https://digitalvision-eg.com/sto0re03/api';
  final Dio _dio;

  ApiServes(this._dio);
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$_baseUrl$endpoint');

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endpoint',
      data: data,
    );

    return response.data;
  }
}
