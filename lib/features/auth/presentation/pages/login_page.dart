import 'package:flutter/material.dart';
import 'package:travelerremake/features/auth/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: LoginForm()));
  }
}
