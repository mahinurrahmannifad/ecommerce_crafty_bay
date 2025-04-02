import 'package:ecommerce_crafty_bay/app/app_colors.dart';
import 'package:ecommerce_crafty_bay/core/extensions/localization_extension.dart';
import 'package:ecommerce_crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogo(),
              const SizedBox(height: 24),
              Text(
                context.localization.welcomeBack,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                context.localization.enterYourEmailAndPassword,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration:
                InputDecoration(hintText: context.localization.email),
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                decoration:
                InputDecoration(hintText: context.localization.password),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(context.localization.signIn),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }
}