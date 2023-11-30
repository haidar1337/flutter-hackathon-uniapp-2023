import 'package:flutter/material.dart';

class LoginPageTitleTexts extends StatelessWidget {
  final String titleText;

  const LoginPageTitleTexts({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
    );
  }
}
