import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/widgets/registration_icon.dart';

class EasyRegistration extends StatelessWidget {
  const EasyRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Or Continue With',
            style: TextStyle(
              color: const Color(0xFF51526B) /* navy */,
              fontSize: 13.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.34,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegistrationIcon(iconPath: 'assets/images/icons/Google_Icon.png'),
            RegistrationIcon(iconPath: 'assets/images/icons/Apple_Icon.png'),
            RegistrationIcon(iconPath: 'assets/images/icons/Facebook_Icon.png'),
          ],
        ),
      ],
    );
  }
}
