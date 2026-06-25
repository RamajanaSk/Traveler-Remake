import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isVisible = false;

  late final FocusNode _focusNode;

  bool _focused = false;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),

        boxShadow: [
          BoxShadow(
            color: _focused
                ? const Color(0xFF6A3CFF).withOpacity(.22)
                : Colors.transparent,
            blurRadius: 24,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: _focused
                ? const Color(0xFF2EE6E6).withOpacity(.10)
                : Colors.transparent,
            blurRadius: 40,
            spreadRadius: -6,
          ),
        ],
      ),

      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        focusNode: _focusNode,

        obscureText: widget.isPassword ? !_isVisible : false,

        cursorColor: const Color.fromARGB(255, 32, 77, 255),

        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),

        decoration: InputDecoration(
          labelText: widget.label,

          labelStyle: TextStyle(color: Colors.white.withOpacity(.55)),

          floatingLabelStyle: const TextStyle(color: Color(0xFF2EE6E6)),

          prefixIcon: Icon(
            widget.icon,
            color: _focused ? const Color(0xFF2EE6E6) : Colors.white60,
          ),

          suffixIcon: widget.isPassword
              ? IconButton(
                  splashRadius: 18,
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: Icon(
                    _isVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.white54,
                  ),
                )
              : null,

          filled: true,

          fillColor: const Color(0x11FFFFFF),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: Colors.white.withOpacity(.08)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFF3A7BFF), width: 1.8),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.redAccent),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          ),
        ),
      ),
    );
  }
}
