import 'package:flutter/material.dart';

class LoginPageTextField extends StatelessWidget {
  const LoginPageTextField(
      {super.key,
      required this.hint,
      required this.icon,
      this.suffix,
      this.obsecuredText,
      required this.validator,
      this.onSaved});

  final String hint;
  final IconData icon;
  final Widget? suffix;
  final bool? obsecuredText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecuredText ?? false,
      validator: validator,
      onSaved: onSaved,
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
