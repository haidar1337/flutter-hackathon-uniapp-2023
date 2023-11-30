import 'package:flutter/material.dart';
import 'package:projectname/features/authentication/presentation/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 125, 64)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

