
import 'package:ecommerce_crafty_bay/app/app_configs.dart';
import 'package:ecommerce_crafty_bay/core/extensions/localization_extension.dart';
import 'package:ecommerce_crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_crafty_bay/features/common/ui/screen/main_bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainBottomNavBarScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                const AppLogo(),
                const Spacer(),
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                    '${context.localization.version} ${AppConfig.currentAppVersion}')
              ],
            ),
          ),
        ));
  }
}