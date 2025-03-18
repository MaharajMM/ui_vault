import 'package:flutter/material.dart';
import 'package:ui_vault/const/colors/app_colors.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
              color: AppColors.kwhite,
              fontSize: 14,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: AppColors.kwhite,
            size: 20,
          ),
        ],
      ),
    );
  }
}
