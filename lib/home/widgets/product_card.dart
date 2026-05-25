import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/home/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.index,
    required this.productModel,
  });
  final int index;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Expanded(
        child: Column(
          children: [
            Image.network(
              productModel.thumbnail!,
            ),
            Text(
              productModel.title!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(productModel.price == null ? '' : productModel.price.toString()),
          ],
        ),
      ),
    );
  }
}
