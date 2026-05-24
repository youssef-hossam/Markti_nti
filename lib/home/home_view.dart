import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leadingWidth: 200,
        leading: Row(
          children: [
            SizedBox(width: 20),
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.darkBlue200, width: 4),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              'Hi, Joe',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/icons/Icon_awesome-bell.png',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What are you looking for ? ',
                hintStyle: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Image.asset(
                  'assets/images/icons/Search_Icons_UIA.png',
                  width: 24.w,
                  height: 24.h,
                ),

                suffix: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.darkBlue100.withAlpha(10), width: 2),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Image.asset(
                    'assets/images/icons/Filter_Icon.png',
                    width: 10.w,
                    height: 10.h,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: AppColors.lightBlue100, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
