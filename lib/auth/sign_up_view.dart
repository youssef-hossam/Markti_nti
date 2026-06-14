import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/sign_up_cubit/sign_up_cubit.dart';
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
  late TextEditingController firstNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  // ignore: non_constant_identifier_names
  late TextEditingController phoneController;
  late TextEditingController lastNameController;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    phoneController = TextEditingController();
    lastNameController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    phoneController.dispose();
    lastNameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  //bloc Consumer

  // bloc  listener
  // bloc builder
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: state.errorMessage,
            btnOkOnPress: () {},
          ).show();
        } else if (state is SignUpSuccess) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Success',
            desc: 'Registration successful! Please log in.',
          ).show().then((value) {
            Navigator.pushNamed(context, '/homeView');
          });
        }
      },
      child: Scaffold(
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
                        hintText: 'first name',
                        iconPath: 'assets/images/icons/Name_Icon.png',
                        labelText: 'first name',
                        controller: firstNameController,
                      ),
                      CustomTextFormField(
                        hintText: 'last name',
                        labelText: 'last name',
                        controller: lastNameController,
                        iconPath: 'assets/images/icons/Username.png',
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
                        hintText: 'Password',
                        labelText: 'Password',
                        controller: passwordController,
                        iconPath: 'assets/images/icons/pass_icon.png',
                        isPassword: true,
                      ),

                      // CustomTextFormField(
                      //   hintText: '*******',
                      //   labelText: 'Confirm Password',
                      //   controller: confirmPasswordController,
                      //   iconPath: 'assets/images/icons/pass_icon.png',
                      //   isPassword: true,
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return CustomButton(
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignUpCubit>().register(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                          );
                        }

                        // Navigator.pushNamed(context, '/BottomNavBar');
                      },
                      text: "Sign Up",
                      child: state is SignUpLoading
                          ? SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.w,
                              ),
                            )
                          : Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                EasyRegistration(),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
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
}
