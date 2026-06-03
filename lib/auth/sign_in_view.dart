// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/models/error_model.dart';
import 'package:marketi_nti/auth/sign_up_view.dart';
import 'package:marketi_nti/auth/widgets/custom_button.dart';
import 'package:marketi_nti/auth/widgets/custom_text_form_field.dart';
import 'package:marketi_nti/auth/widgets/skip_button.dart';
import 'package:marketi_nti/core/app_colors.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';

class SignInView extends StatefulWidget {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  ApiConsumer apiConsumer = ApiConsumer();
  bool value = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  initState() {
    super.initState();
    widget.emailController = TextEditingController();
    widget.passwordController = TextEditingController();
  }

  @override
  dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SizedBox(
              width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  SkipButton(),
                  SizedBox(
                    height: 7.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/Logo_Splash_Screen.png',
                      fit: BoxFit.cover,
                      width: 300.w,
                      height: 250.h,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),

                  Form(
                    key: widget.formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          iconPath: 'assets/images/icons/email_Icon.png',
                          hintText: 'Username or Email',
                          controller: widget.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Regular expression for validating an Email
                            String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 14.h,
                        ),

                        CustomTextFormField(
                          iconPath: 'assets/images/icons/pass_icon.png',
                          hintText: 'Password',
                          controller: widget.passwordController,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }

                            //                            // Regular expression for validating a password (at least one uppercase letter, one lowercase letter, one digit, and one special character)
                            // String pattern =
                            //     r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
                            // RegExp regex = RegExp(pattern);
                            // if (!regex.hasMatch(value)) {
                            //   return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character';
                            // }
                            return null;
                          },
                        ),

                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Transform.translate(
                                  offset: Offset(7, 0),
                                  child: Checkbox.adaptive(
                                    // visualDensity: VisualDensity(horizontal: -4.w, vertical: -4.h),
                                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    activeColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.all(Radius.circular(4.r)),
                                    ),
                                    value: widget.value,
                                    onChanged: (value) {
                                      widget.value = value!;
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    color: const Color(0xFF51526B) /* navy */,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 1.34,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppColors.lightBlue100,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.36,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    ontap: () async {
                      // validate  of the format email and password length
                      if (widget.formKey.currentState!.validate()) {
                        // post request that send email and password  to login with this credantials and get the access token and refresh token and save them in shared preferences

                        widget.apiConsumer.post(
                          context: context,
                          url: 'https://accessories-eshop.runasp.net/api/auth/login',
                          data: {
                            "email": widget.emailController.text.toString(),
                            "password": widget.passwordController.text.toString(),
                          },
                        );
                      }
                    },
                    text: "Sign In",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Center(
                    child: Text(
                      'Or Continue With',
                      style: TextStyle(
                        color: const Color(0xFF51526B) /* navy */,
                        fontSize: 18.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.34,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: const Color(0xFF51526B) /* navy */,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.34,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppColors.lightBlue100,
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 1.36,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {}

  //     log(response.data['accessToken']);
  //     log(response.statusCode.toString());
  //     if (response.statusCode == 200) {
  //       // navigate to home view
  // if(!mounted) return;
  //       Navigator.pushNamed(context, '/homeView');
  //     }
  //   }
}
