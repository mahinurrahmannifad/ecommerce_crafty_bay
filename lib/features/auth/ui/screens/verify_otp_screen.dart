import 'package:ecommerce_crafty_bay/core/extensions/localization_extension.dart';
import 'package:ecommerce_crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp-screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  String currentPin = "";

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
                context.localization.enterYourOtpCode,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                context.localization.aFourDigitCodeHasBeenSent,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 16),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 16),
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTEController,
                appContext: context,
                mainAxisAlignment: MainAxisAlignment.center,
                autoDisposeControllers: false,
                autovalidateMode: AutovalidateMode.disabled,
                onChanged: (value) {
                  setState(() {
                    currentPin = value;
                  }
                  );
                }
              ),


              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _onTapSignUpButton();
                },
                child: Text(context.localization.verify),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}