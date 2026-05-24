import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;

  const CustomButton({
    super.key,

    required this.ontap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 44.h,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Colors.blue, width: 2.w),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
