import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_colors.dart';
import 'package:marketi_nti/home/cubit/products_cubit.dart';
import 'package:marketi_nti/home/models/product_model.dart';
import 'package:marketi_nti/home/widgets/product_card.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  ProductsCubit productsCubit = ProductsCubit();

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  initState() {
    super.initState();

    widget.productsCubit.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 200,
        leading: Row(
          children: [
            SizedBox(width: 20),
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.darkBlue200, width: 4),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              'Hi, Joe',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/icons/Icon_awesome-bell.png',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),

      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductSucess) {

            return GridView.builder(
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  ProductCard(
                    index: index,
                    productModel: state.products[index],
                  ),
                ],
              ),
            );
          } else if (state is ProductsFailure) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),
      // body: FutureBuilder(
      //   future: getAllProducts(),
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return Center(child: CircularProgressIndicator());

      //       case ConnectionState.done:
      //         if (snapshot.hasData) {
      //           final data = snapshot.data as Map<String, dynamic>;

      //           return GridView.builder(
      //             itemCount: data['products'].length,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               childAspectRatio: 0.8,
      //               crossAxisCount: 2,
      //             ),

      //             itemBuilder: (context, index) => Column(
      //               children: [
      //                 // ProductCard(: data, index: index),
      //                 ProductCard(
      //                   index: index,
      //                   productModel: ProductModel.fromJson(data['products'][index]),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }

      //       case ConnectionState.none:
      //         return Center(child: Text('No connection'));

      //       case ConnectionState.active:
      //         return Center(child: Text('Active connection'));
      //     }

      //     return Container();
      //   },
      // ),
    );

    // get all products function
  }
}
