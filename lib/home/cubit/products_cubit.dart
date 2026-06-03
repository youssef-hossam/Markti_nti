import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_nti/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    try {
      final dio = Dio();
      Response response = await dio.get('https://dummyjson.com/products');
      Map<String, dynamic> productsData = response.data as Map<String, dynamic>;
      // log(productsData['products'].toString());
      List<ProductModel> products = productsData['products']
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();

      // log(products.toString());
      emit(ProductSucess(products));
    } on Exception catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }
}
