import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        debugShowCheckedModeBanner: false,
        initialRoute: '/onboarding',
        routes: {


          '/signIn': (context) =>  SignInView(),
          '/onboarding': (context) => OnBoarding(),
          //  '/second':(context) => SecondPage(),
        },
      ),
    );
  }
}
