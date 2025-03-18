import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ui_vault/const/app_defaults.dart';
import 'package:ui_vault/const/colors/app_colors.dart';
import 'package:ui_vault/core/router/router.gr.dart';
import 'package:ui_vault/shared/widget/animations/slide_animation_builder.dart';
import 'package:ui_vault/shared/widget/buttons/app_primary_btn.dart';
import 'package:velocity_x/velocity_x.dart';

class IntroPageBodyArea extends StatelessWidget {
  const IntroPageBodyArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SlideAnimationBuilder(
                    delay: const Duration(milliseconds: 250),
                    child: Text(
                      'Welcome to',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 26,
                          ),
                    ),
                  ),
                  // Second text with slightly delayed animation
                  SlideAnimationBuilder(
                    delay: const Duration(milliseconds: 350),
                    child: Text(
                      'UI Vault',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryColor,
                            fontSize: 56,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          30.heightBox,
          Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child: Column(
              children: [
                SlideAnimationBuilder(
                  delay: const Duration(milliseconds: 400),
                  child: PrimaryButton(
                    labelText: "Dive In",
                    fontColor: AppColors.kPrimaryColor,
                    onPressed: () => context.navigateTo(LoginRoute()),
                  ),
                ),
                20.heightBox,
                SlideAnimationBuilder(
                  delay: const Duration(milliseconds: 500),
                  child: PrimaryButton(
                    labelText: 'Start your journey',
                    onPressed: () => context.navigateTo(SignUpRoute()),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
