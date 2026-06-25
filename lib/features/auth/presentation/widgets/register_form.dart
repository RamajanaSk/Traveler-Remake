import 'package:flutter/material.dart';
import 'package:travelerremake/core/text/gradient_title.dart';
import 'package:travelerremake/core/theme/app_colors.dart';
import 'package:travelerremake/core/widgets/app_button.dart';
import 'package:travelerremake/core/widgets/divider/line_divider.dart';
import 'package:travelerremake/core/widgets/inputs/app_text_field.dart';

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
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 460),
        padding: const EdgeInsets.all(36),

        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const GradientTitle(text: "SIGN UP"),

              const SizedBox(height: 22),

              //----------------------------------------
              // Subtitle
              //----------------------------------------
              Text(
                "Create your Traveler account\nand start exploring the world.",
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
                    return "Please enter a username";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 18),

              //----------------------------------------
              // Email
              //----------------------------------------
              AppTextField(
                controller: TextEditingController(),
                label: "Email",
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  if (!value.contains("@")) {
                    return "Please enter a valid email";
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
                    return "Please enter a password";
                  }

                  if (value.length < 8) {
                    return "Minimum 8 characters";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 18),

              //----------------------------------------
              // Confirm Password
              //----------------------------------------
              AppTextField(
                controller: TextEditingController(),
                label: "Confirm Password",
                icon: Icons.lock_outline,
                isPassword: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return "Passwords don't match";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 28),

              //----------------------------------------
              // Register Button
              //----------------------------------------
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: "Begin Your Journey",
                  icon: Icons.arrow_forward_rounded,
                  onPressed: _login,
                ),
              ),

              const SizedBox(height: 28),

              Divider(color: Colors.white.withOpacity(.08)),

              const SizedBox(height: 18),

              //----------------------------------------
              // Footer
              //----------------------------------------
              Text(
                "Already exploring?",
                style: TextStyle(color: Colors.white.withOpacity(.55)),
              ),

              const SizedBox(height: 10),

              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) =>
                        AppColors.travelerGradient.createShader(bounds),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Log In",
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
