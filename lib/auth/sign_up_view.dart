import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/widgets/custom_button.dart';
import 'package:marketi_nti/auth/widgets/custom_text_form_field.dart';
import 'package:marketi_nti/auth/widgets/easy_registeration.dart';

class SignUpView extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  // ignore: non_constant_identifier_names
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 14.w, left: 14.w, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/Logo_Splash_Screen.png',
                        fit: BoxFit.cover,
                        width: 187.58627319335938.w,
                        height: 160.h,
                      ),
                    ),
                  ),
                  SizedBox(width: 48.w),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Name',
                      iconPath: 'assets/images/icons/Name_Icon.png',
                      labelText: 'Name',
                      controller: nameController,
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      labelText: 'Email',
                      controller: emailController,
                      iconPath: 'assets/images/icons/email_Icon.png',
                    ),

                    CustomTextFormField(
                      hintText: '01140123456',
                      labelText: 'Phone',
                      controller: phoneController,
                      iconPath: 'assets/images/icons/Phone.png',
                    ),
                    CustomTextFormField(
                      hintText: 'Username',
                      labelText: 'Username',
                      controller: usernameController,
                      iconPath: 'assets/images/icons/Username.png',
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      labelText: 'Password',
                      controller: passwordController,
                      iconPath: 'assets/images/icons/pass_icon.png',
                      isPassword: true,
                    ),

                    CustomTextFormField(
                      hintText: '*******',
                      labelText: 'Confirm Password',
                      controller: confirmPasswordController,
                      iconPath: 'assets/images/icons/pass_icon.png',
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              CustomButton(
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform sign-up logic here
                    // For example, you can call an API to register the user
                    // After successful registration, navigate to the home view
                    // Navigator.pushNamed(context, '/homeView');
                  }

                  // Navigator.pushNamed(context, '/BottomNavBar');
                },
                text: "Sign Up",
              ),
              SizedBox(height: 16.h),
              EasyRegistration(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  register() async {
    try {
      Response response = await Dio().post(
        'https://accessories-eshop.runasp.net/api/auth/register',
        data: {
          "email": emailController.text.toString(),
          "password": passwordController.text.toString(),
          "firstName": nameController.text.toString(),
          "lastName": '',
        },
      );
    } on DioException catch (e) {





      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        log('Connection timed out. Please try again later.');
        // TODO
      } else if (e.type == DioExceptionType.badResponse) {
        log('Received invalid status code: ${e.response?.statusCode}');

        // TODO
      } else {
        log('An unexpected error occurred: ${e.message}');
        // TODO
      }
    }
  }
}

//
// {
//     "statusCode": 400,
//     "message": "One or more errors occurred!",
//     "errors": {
//         "email": [
//             "Email is already in use."
//         ]
//     }
// }

// list of errors  = [ " password  : Password must be at least 8 characters.",
//password  :Password must contain at least one uppercase letter
//password  :Password must contain at least one digit.
//
//
//
// ]

