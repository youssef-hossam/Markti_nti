import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_nti/home/cubit/products_cubit.dart';
import 'package:marketi_nti/home/models/product_model.dart';
import 'package:marketi_nti/home/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllProductsBlocBuilder extends StatelessWidget {
  const AllProductsBlocBuilder({super.key});

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: .8,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final bool isLoading = state is ProductsLoading;

        final List<ProductModel> products = isLoading
            ? _fakeProducts
            : state is ProductsSucess
            ? state.products
            : [];

        if (state is ProductsFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              textAlign: TextAlign.center,
            ),
          );
        }

        if (products.isEmpty && !isLoading) {
          return const Center(
            child: Text('No Products Found'),
          );
        }

        return Skeletonizer(
          enabled: isLoading,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            gridDelegate: _gridDelegate,
            itemBuilder: (context, index) {
              return ProductCard(
                index: index,
                productModel: products[index],
              );
            },
          ),
        );
      },
    );
  }
}

final List<ProductModel> _fakeProducts = List.generate(
  10,
  (index) => ProductModel(
    title: 'Loading Product',
    price: '',
    thumbnail: 'https://blocks.astratic.com/img/general-img-landscape.png',
  ),
);
