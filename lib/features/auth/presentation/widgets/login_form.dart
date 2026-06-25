import 'package:flutter/material.dart';
import 'package:travelerremake/core/text/gradient_title.dart';
import 'package:travelerremake/core/theme/app_colors.dart';
import 'package:travelerremake/core/widgets/app_button.dart';
import 'package:travelerremake/core/widgets/bar/bottombar/traveler_bottom_bar.dart';
import 'package:travelerremake/core/widgets/inputs/app_text_field.dart';
import 'package:travelerremake/core/widgets/divider/line_divider.dart';
import 'package:travelerremake/features/auth/presentation/pages/register_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TravelerBottomBar(username: 'Ramajana', userId: '123'),
      ),
    );

    //if (_formKey.currentState!.validate()) {
    //debugPrint(_usernameController.text);
    //debugPrint(_passwordController.text);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 460),
        padding: const EdgeInsets.all(36),

        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 26),

              //----------------------------------------
              // Title
              //----------------------------------------
              const GradientTitle(text: "LOG IN"),

              const SizedBox(height: 22),

              //----------------------------------------
              // Subtitle
              //----------------------------------------
              Text(
                "Welcome back.\nContinue your journey.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(.65),
                  fontSize: 16,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 34),

              //----------------------------------------
              // Username
              //----------------------------------------
              AppTextField(
                controller: _usernameController,
                label: "Username",
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              //----------------------------------------
              // Password
              //----------------------------------------
              AppTextField(
                controller: _passwordController,
                label: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),

              //----------------------------------------
              // Forgot Password
              //----------------------------------------
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.white.withOpacity(.6)),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //----------------------------------------
              // Button
              //----------------------------------------
              SizedBox(
                width: double.infinity,
                child: AppButton(text: "Continue Journey", onPressed: _login),
              ),

              const SizedBox(height: 26),

              Divider(color: Colors.white.withOpacity(.08)),

              const SizedBox(height: 18),

              //----------------------------------------
              // Bottom
              //----------------------------------------
              Text(
                "Don't have an account?",
                style: TextStyle(
                  color: Colors.white.withOpacity(.55),
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 12),

              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) =>
                        AppColors.travelerGradient.createShader(bounds),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Create one",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.arrow_forward_rounded, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
