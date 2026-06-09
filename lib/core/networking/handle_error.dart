import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/auth/models/error_model.dart';
import 'package:marketi_nti/auth/widgets/pop_up_dialog.dart';

void handleError(
  DioException e,
) {
  if (e.type case DioExceptionType.badResponse) {
    switch (e.response?.statusCode) {
      case 400:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        break;

      case 401:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        break;

      case 403:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        break;

      case 404:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        break;

      case 422:
        ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
        String errorMessage = '';
        errorModel.errors.forEach((error) => errorMessage += '$error\n');

        break;

      case 500:
        log('Internal Server Error');
        break;
      //
    }
  } else if (e.type case DioExceptionType.connectionTimeout) {
    log('Connection timed out. Please try again later.');
  } else if (e.type case DioExceptionType.receiveTimeout) {
    log('Connection timed out. Please try again later.');
  } else if (e.type case DioExceptionType.sendTimeout) {
    log('Connection timed out. Please try again later.');
  } else if (e.type case DioExceptionType.unknown) {
    log('An unexpected error occurred: ${e.message}');
  } else if (e.type case DioExceptionType.cancel) {
    log('Request was cancelled: ${e.message}');
  } else {}
}
