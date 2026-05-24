import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_colors.dart';

Widget SkipButton() {
  return Container(
    width: 55.w,
    height: 44.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.r),
      border: Border.all(color: Color(0xFF8CB3FF).withAlpha(100), width: 2),
    ),
    child: Center(
      child: Text(
        'Skip',
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.lightBlue100,
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}
