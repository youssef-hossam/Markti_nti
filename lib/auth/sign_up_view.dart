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
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController = TextEditingController();
  // ignore: non_constant_identifier_names
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController usernameController = TextEditingController();

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
              SizedBox(height: 14.h),
              CustomButton(
                ontap: () {
                  Navigator.pushNamed(context, '/BottomNavBar');
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
}
