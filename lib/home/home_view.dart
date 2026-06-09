import 'package:flutter/material.dart';
import 'package:marketi_nti/home/widgets/all_products_bloc_builder.dart';
import 'package:marketi_nti/home/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: AllProductsBlocBuilder(),
    );

    // get all products function
  }

}