import 'package:flutter/material.dart';
import 'package:travelerremake/features/auth/presentation/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: RegisterForm()));
  }
}
