import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/dark_theme.dart' as DarkTheme;
import 'package:marketi_nti/home/cubit/products_cubit.dart';
import 'package:marketi_nti/home/home_view.dart';
import 'package:marketi_nti/navigation/bottom_navigation_bar.dart';
import 'package:marketi_nti/on_boarding/on_boarding.dart';
import 'package:marketi_nti/auth/sign_in_view.dart';

class MarktiNtiApp extends StatelessWidget {
  const MarktiNtiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        darkTheme: DarkTheme.darkThemeData(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/homeView',
        routes: {
          '/signIn': (context) => SignInView(),
          '/onboarding': (context) => OnBoarding(),
          '/homeView': (context) => BlocProvider(
            create: (context) => ProductsCubit (),
            child: HomeView(),
          ),
          '/BottomNavBar': (context) => BottomNavBar(),
          //  '/second':(context) => SecondPage(),
        },
      ),
    );
  }
}
