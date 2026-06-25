import 'package:flutter/material.dart';
import 'package:travelerremake/core/text/gradient_title.dart';
import 'package:travelerremake/core/theme/app_colors.dart';
import 'package:travelerremake/core/theme/space_background.dart';
import 'package:travelerremake/core/widgets/divider/line_divider.dart';
import 'package:travelerremake/features/auth/presentation/pages/login_page.dart';
import 'package:travelerremake/features/auth/presentation/pages/register_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 7),

              const Text(
                "TRAVELER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  height: 1.2,
                ),
              ),

              GradientTitle(text: "START"),

              GradientTitle(text: "DISCOVERING"),

              const SizedBox(height: 28),

              const LineDivider(),

              const SizedBox(height: 22),

              Text(
                "The best stories are never planned.\nThey begin the moment you step outside.",
                style: TextStyle(
                  color: Colors.white.withOpacity(.70),
                  fontSize: 18,
                  height: 1.6,
                ),
              ),

              const Spacer(),

              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      width: 1,
                      height: 18,
                      color: Colors.white24,
                    ),

                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.65),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
