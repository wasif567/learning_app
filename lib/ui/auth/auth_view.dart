import 'package:flutter/material.dart';
import 'package:learning_app/utilities/ui/app_colors/app_colors.dart';
import 'package:learning_app/utilities/ui/app_constants/app_constants.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.85),
      body: SizedBox(
        height: kSize.height,
        width: kSize.width,
        child: Center(
          child: Container(
            width: kSize.width,
            margin: const EdgeInsets.symmetric(horizontal: AppConstants.basePadding),
          ),
        ),
      ),
    );
  }
}
