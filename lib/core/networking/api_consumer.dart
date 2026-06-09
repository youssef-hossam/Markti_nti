import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/core/networking/handle_error.dart';

class ApiConsumer {
  Dio dio = Dio();

  ApiConsumer() {
    // dio.options.baseUrl = 'https://accessories-eshop.runasp.net/api';
  }

  Future<void> post({
    // Map<String, dynamic>? queryParameters,
    required String url,

    required Map<String, dynamic> data,
  }) async {
    await dio.post(
      url,
      data: data,
      // queryParameters: queryParameters,
    );
  }

  Future<Response> get(
    Map<String, dynamic>? queryParameters, {
    required String url,

    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.get(
      url,
      data: data,
      queryParameters: queryParameters,
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
