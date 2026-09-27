import 'package:flutter/material.dart';
import 'app_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  static final RegExp _emailRegex =
      RegExp(r'^[\w\.\-\+]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final String name = _nameController.text.trim();

    // Pass the entered full name to Home as the route argument.
    Navigator.pushReplacementNamed(context, '/home', arguments: name);
  }

  void _goToLogin() {
    // Navigator.pop returns to the Login screen that pushed this one.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(kScreenPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Create an account to get started.',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 14, color: AppColors.textMuted),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _nameController,
                        style: appInputTextStyle,
                        decoration: appInputDecoration('Full Name'),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kFieldSpacing),
                      TextFormField(
                        controller: _emailController,
                        style: appInputTextStyle,
                        decoration: appInputDecoration('Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!_emailRegex.hasMatch(value.trim())) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kFieldSpacing),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        style: appInputTextStyle,
                        decoration: appInputDecoration('Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: kFieldSpacing),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        style: appInputTextStyle,
                        decoration: appInputDecoration('Confirm Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        style: primaryButtonStyle(),
                        onPressed: _signUp,
                        child: const Text('Sign Up'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _goToLogin,
                        child: const Text('Already have an account? Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // No AppBar / black header bar anymore — a plain back button
            // floats over the content instead.
            Positioned(
              top: 4,
              left: 4,
              child: IconButton(
                onPressed: _goToLogin,
                icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
