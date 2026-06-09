import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_nti/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Dio dio = Dio();
  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    try {
      Response response = await dio.get('https://dummyjson.com/products');
      var data = response.data;
      List<ProductModel> products = data["products"]
          .map<ProductModel>((product) => ProductModel.fromJson(product))
          .toList();

      emit(ProductsSucess(products: products));
    } on DioException catch (e) {
      emit(ProductsFailure(errorMessage: e.message ?? 'An error occurred'));
    }
  }
}
