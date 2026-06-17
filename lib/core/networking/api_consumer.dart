import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/core/networking/handle_error.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiConsumer {
  Dio dio = Dio();

  ApiConsumer() {
    dio.options.baseUrl = 'https://accessories-eshop.runasp.net/api/';
    dio.interceptors.add(
      PrettyDioLogger(),
    );
  }

  Future<Response> post({
    // Map<String, dynamic>? queryParameters,
    required String url,

    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.post(
      url,
      data: data,
      // queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> get({
    required String url,

    required String token,
  }) async {
    Response response = await dio.get(
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
      url,
    );

    return response;
  }

  Future<Response> put(
    Map<String, dynamic>? queryParameters, {
    required String url,

    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }
}
