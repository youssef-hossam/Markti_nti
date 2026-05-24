import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: Color(0xFF8CB3FF), width: 1),
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAlias,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Image.asset('assets/icons/Vector.png'),
      ),
    );
  }
}