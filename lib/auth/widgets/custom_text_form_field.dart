import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String iconPath;
  final String? labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final String hintText;
  const CustomTextFormField({
    super.key,
    required this.iconPath,
    this.labelText,
    this.controller,
    this.isPassword = false,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null)
            Text(
              labelText!,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),

          // labelText != null
          //     ? Text(
          //         labelText ?? '',
          //         style: TextStyle(
          //           fontSize: 14.sp,
          //           color: Colors.grey,
          //         ),
          //       )
          //     : Container(),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Image.asset(
                iconPath,
                width: 20.w,
                height: 20.h,
                color: Colors.blue,
              ),

              // prefix: Image.asset('assets/images/icons/email_Icon.png'),
              hintText: hintText,
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
          ),
        ],
      ),
    );
  }
}
