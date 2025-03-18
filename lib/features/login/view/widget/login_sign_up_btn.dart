import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ui_vault/const/colors/app_colors.dart';
import 'package:ui_vault/core/router/router.gr.dart';

class LoginSignUpBtn extends StatelessWidget {
  final bool isLogin;
  const LoginSignUpBtn({
    super.key,
    this.isLogin = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isLogin ? context.router.replace(LoginRoute()) : context.router.replace(SignUpRoute());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Text(
              isLogin ? 'Login' : 'Sign Up',
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
      ),
    );
  }
}
