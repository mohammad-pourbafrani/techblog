import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_servise;

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    //dio.options.headers['content-Type'] = "application/json";

    return await dio
        .get(
      url,
      options: Options(
        contentType: "application/json",
        responseType: ResponseType.json,
        method: "GET",
      ),
    )
        .then((response) {
      return response;
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> data, String url) async {
    //dio.options.headers['content-Type'] = "application/json";
    //TODO:read token from storage

    return await dio
        .post(
      url,
      data: dio_servise.FormData.fromMap(data),
      options: Options(
        contentType: "application/json",
        responseType: ResponseType.json,
        method: "POST",
      ),
    )
        .then((value) {
      log(value.headers.toString());
      log(value.statusCode.toString());
      log(value.data.toString());
      return value;
    });
  }
}
