import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi_nti/auth/sign_in_cubit/sign_in_cubit.dart';

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
        child: BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            return Center(
              child: state is SignInLoading
                  ? CircularProgressIndicator()
                  : Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
