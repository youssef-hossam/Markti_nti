import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketi_nti/auth/sign_up_cubit/sign_up_cubit.dart';
import 'package:marketi_nti/auth/sign_up_view.dart';
import 'package:marketi_nti/core/dark_theme.dart' as DarkTheme;
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/home/cubit/products_cubit.dart';
import 'package:marketi_nti/home/home_view.dart';
import 'package:marketi_nti/locator.dart';
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
        initialRoute: '/signIn',
        routes: {
          '/signIn': (context) => BlocProvider(
            create: (context) => SignInCubit(apiConsumer: getIt<ApiConsumer>()),
            child: SignInView(),
          ),
          SignUpView.routeName: (context) => BlocProvider(
            create: (context) => SignUpCubit(apiConsume: getIt<ApiConsumer>()),
            child: SignUpView(),
          ),
          '/onboarding': (context) => OnBoarding(),
          '/homeView': (context) => HomeView(),
          '/BottomNavBar': (context) => BlocProvider(
            create: (context) => ProductsCubit()..getAllProducts(),
            child: BottomNavBar(),
          ),
          //  '/second':(context) => SecondPage(),
        },
      ),
    );
  }
}
