import 'package:e_commerce/app/extensions/localization_extension.dart';
import 'package:e_commerce/featues/auth/presentation/screens/verify_otp_screen.dart';
import 'package:e_commerce/featues/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 24),
                AppLogo(width: 80),
                const SizedBox(height: 12),
                Text(
                  'Create new account',
                  style: textTheme.titleLarge,
                ),
                Text(
                  'Please enter your details for new account ',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'First name'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Last name'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _mobileTEController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _addressTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Address'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _onTapSignUpButton,
                  child: Text('Sign Up'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _onTapBackToLoginButton,
                  child: Text('Back to Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }
  void _onTapBackToLoginButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _addressTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
