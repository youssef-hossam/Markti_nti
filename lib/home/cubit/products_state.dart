part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductSucess extends ProductsState {
  final List<ProductModel> products;
  ProductSucess(this.products);
}

class ProductsFailure extends ProductsState {
final String errorMessage;
ProductsFailure(this.errorMessage);
}
