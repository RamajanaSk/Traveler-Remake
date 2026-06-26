import 'package:flutter/material.dart';
import 'package:travelerremake/core/theme/app_colors.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.isLoading
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? 1.02 : 1,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),

            gradient: AppColors.travelerGradient,

            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFF6A3CFF,
                ).withOpacity(_hovered ? .40 : .22),
                blurRadius: _hovered ? 28 : 18,
                spreadRadius: _hovered ? 2 : 0,
              ),

              BoxShadow(
                color: const Color(
                  0xFF2EE6E6,
                ).withOpacity(_hovered ? .22 : .10),
                blurRadius: _hovered ? 40 : 25,
                spreadRadius: -4,
              ),
            ],
          ),

          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: widget.isLoading ? null : widget.onPressed,

              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),

                  child: widget.isLoading
                      ? const SizedBox(
                          key: ValueKey("loading"),
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : Row(
                          key: const ValueKey("button"),
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.icon != null) ...[
                              Icon(widget.icon, color: Colors.white, size: 20),
                              const SizedBox(width: 10),
                            ],

                            Text(
                              widget.text,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                letterSpacing: .3,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
