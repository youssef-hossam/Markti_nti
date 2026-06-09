
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/core/app_colors.dart';

AppBar customAppBar() {
    return AppBar(
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
    );
  }