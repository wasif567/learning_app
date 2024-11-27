import 'package:flutter/material.dart';
import 'package:learning_app/routes/common_navigate.dart';
import 'package:learning_app/utilities/app_images.dart';
import 'package:learning_app/utilities/ui/app_colors/app_colors.dart';
import 'package:learning_app/utilities/ui/app_typography/app_typography.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;
  bool isPaused = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    // Define the Tween from 0 to 1 (for LinearProgressIndicator)
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!);

    // Start the animation
    startProgress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.85),
      body: SizedBox(
        height: kSize.height,
        width: kSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              height: kSize.height * 0.1,
              width: kSize.height * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(top: kSize.height * 0.02),
              child: Text(
                "Academy",
                style: AppTypography.anekMalayalamSemiBold.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: kSize.width * 0.35, right: kSize.width * 0.35, top: kSize.height * 0.07),
              child: AnimatedBuilder(
                  animation: _animation!,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      value: _animation!.value,
                      color: Colors.purple,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  navigateToAuth() async {
    CommonNavigate(parentContext: context).navigateAuthView();
  }

  void startProgress() async {
    _controller!.forward();

    // Stop the animation when it reaches 65% (0.65)
    await Future.delayed(const Duration(milliseconds: 3900)); // 65% of 6 seconds
    // _controller!.stop();
    _controller!.stop();

    isPaused = true;

    // Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Resume the animation after the delay and complete to 100%
    _controller!.forward(from: _controller!.value);

    isPaused = false;
    _controller!.addListener(() {
      if (_controller!.isCompleted) {
        navigateToAuth();
      }
    });
  }
}
