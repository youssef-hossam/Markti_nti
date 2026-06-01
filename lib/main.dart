import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marketi_nti/my_app.dart';

void main() async {
  runApp(MarktiNtiApp());

  ErrorModel errorModel = ErrorModel.fromJson(json);
  log(errorModel.statusCode.toString());
  log(errorModel.message.toString());
  log(errorModel.errors.toString());
}

Map<String, dynamic> json = {
  "statusCode": 400,
  "message": "One or more errors occurred!",
  "errors": {
    "password": [
      "Password must be at least 8 characters.",
      "Password must contain at least one uppercase letter.",
      "Password must contain at least one digit.",
      "Password must contain at least one special character.",
    ],
  },
};

class ErrorModel {
  int? statusCode;
  String? message;
  List<String> errors;

  ErrorModel({
    this.statusCode,
    this.message,
    required this.errors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    List<String> errorsList = [];
    if (json['errors'] != null) {
      json['errors'].forEach((key, value) {
        for (var error in value) {
          errorsList.add('$key : $error');
        }
      });
    }

    return ErrorModel(
      errors: errorsList,
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}

// getAllProducts() async {
//   //https://dummyjson.com/products
//   // combine the base url and the endpoint to create the full url
//   var url = Uri.https('dummyjson.com', '/products');
//   // make the http get request and wait for the response
//   var response = await http.get(url);

//   if (response.statusCode == 200) {

//
//     var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
//
//
//     // log(jsonResponse.toString());

//     log(jsonResponse['products'][0]['title']);

//     // log(response.body);
//     // log the status code and the response body to the console
//     //  log(response.statusCode.toString());
//     // log the response body to the console
//     //  log(response.body);
//   }



// {
//     "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhYjNmODI1OC00MzU4LTQwMGEtMjA4Ny0wOGRlYmZlYTExZTEiLCJqdGkiOiJlMTQ3NDM0ZC01ODI1LTRhMjQtYTYzNS0zNTExZTUxZDg0MDIiLCJlbWFpbCI6InZheG9mZXM5NTVAbWF0a2luZC5jb20iLCJuYW1lIjoieW91c3NlZiBob3NzYW0iLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3ODA1NDE2MTMsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.PXgtEmWg0PMvUEcNHvlts-c51L0YBMWIhb_fF_yyFI0",
//     "expiresAtUtc": "2026-06-04T02:53:33.3056645Z",
//     "refreshToken": "/gcl/jZT08aKNrftUjgsXO0laYMFjtn33RGquHJoCmm8P7XIS1B/2M7K44mXZORW8g9AWFQrwu+3cmCFJQxt7w=="
// }