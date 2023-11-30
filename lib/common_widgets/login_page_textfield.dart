import 'package:flutter/material.dart';

class LoginPageTextField extends StatelessWidget {
  const LoginPageTextField(
      {super.key,
      required this.hint,
      required this.icon,
      this.suffix,
      this.obsecuredText});

  final String hint;
  final IconData icon;
  final Widget? suffix;
  final bool? obsecuredText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecuredText ?? false,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: Icon(icon),
        suffixIcon: suffix,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
