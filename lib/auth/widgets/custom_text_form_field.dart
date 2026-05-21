import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String iconPath;
  final String labelText;
  const CustomTextFormField({
    super.key,
    required this.iconPath,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          iconPath,
          width: 20.w,
          height: 20.h,
          color: Colors.blue,
        ),
        // prefix: Image.asset('assets/images/icons/email_Icon.png'),
        hintText: labelText,

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(
              0xFF8CB3FF,
            ),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF8CB3FF).withAlpha(100),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF8CB3FF).withAlpha(100),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
    );
  }
}
