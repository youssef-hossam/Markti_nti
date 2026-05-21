// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/widgets/custom_text_form_field.dart';
import 'package:marketi_nti/auth/widgets/skip_button.dart';

class SignInView extends StatefulWidget {
  late TextEditingController emailController;
  late TextEditingController passwordController;
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
      body: SafeArea(
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
                        labelText: 'Username or Email',
                      ),

                      SizedBox(
                        height: 14.h,
                      ),

                      CustomTextFormField(
                        iconPath: 'assets/images/icons/pass_icon.png',
                        labelText: 'Password',
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
                              color: const Color(0xFF3F80FF),
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
                Container(
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: Colors.blue, width: 2.w),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
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
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: const Color(0xFF3F80FF),
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
    );
  }
}
