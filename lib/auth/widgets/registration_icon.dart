import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationIcon extends StatelessWidget {
  final String iconPath;
  const RegistrationIcon({required this.iconPath, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: CircleBorder(),
      child: InkWell(
        onTap: () {},
        child: Image.asset(iconPath, width: 60.w, height: 50.h),
      ),
    );
  }
}
