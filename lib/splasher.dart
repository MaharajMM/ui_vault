import 'package:flutter/material.dart';
import 'package:ui_vault/app/view/app.dart';
import 'package:ui_vault/bootstrap.dart';
import 'package:ui_vault/const/colors/app_colors.dart';
import 'package:ui_vault/features/splash/view/splash_view.dart';

class Splasher extends StatelessWidget {
  const Splasher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: AppColors.kPrimaryColor),
      home: SplashView(
        removeSpalshLoader: false,
        onInitialized: (container) {
          bootstrap(
            () => const App(),
            parent: container,
          );
        },
      ),
    );
  }
}
