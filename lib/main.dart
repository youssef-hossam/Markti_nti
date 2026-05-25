import 'dart:convert' as convert;
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/my_app.dart';

void main() async {
  runApp(MarktiNtiApp());
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
