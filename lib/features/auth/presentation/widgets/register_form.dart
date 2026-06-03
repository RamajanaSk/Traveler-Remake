import 'package:flutter/material.dart';
import 'package:travelerremake/core/widgets/app_button.dart';
import 'package:travelerremake/core/widgets/app_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      print("Username: ${_usernameController.text}");
      print("Password: ${_passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      constraints: const BoxConstraints(maxWidth: 450),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Login", style: Theme.of(context).textTheme.headlineMedium),

            const SizedBox(height: 24),

            AppTextField(
              controller: _usernameController,
              label: "Username",
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a username";
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: _passwordController,
              label: "Password",
              icon: Icons.lock_outline,
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a password";
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            AppButton(text: "Login", onPressed: _login),
          ],
        ),
      ),
    );
  }
}
