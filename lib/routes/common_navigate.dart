import 'package:flutter/material.dart';
import 'package:learning_app/ui/auth/auth_view.dart';
import 'package:learning_app/ui/splash/splash_view.dart';

class CommonNavigate {
  final BuildContext parentContext;
  CommonNavigate({required this.parentContext});

  navigateSplash() {
    Navigator.pushAndRemoveUntil(
        parentContext,
        MaterialPageRoute(
          builder: (context) => const SplashView(),
        ),
        (route) => false);
  }

  navigateAuthView() {
    Navigator.pushReplacement(
      parentContext,
      MaterialPageRoute(
        builder: (context) => const AuthView(),
      ),
    );
  }
}
