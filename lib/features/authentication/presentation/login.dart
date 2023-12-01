import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectname/common_widgets/login_page_textfield.dart';
import 'package:projectname/common_widgets/login_page_title_texts.dart';
import 'package:projectname/features/authentication/data/auth_repository.dart';
import 'package:projectname/features/tabs/presentation/tabs.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    String? studentId;
    String? password;

    final authProvider = ref.watch(
      authenticationRepositoryProvider(context),
    );

    void authenticateUser() async {
      if (!formKey.currentState!.validate()) {
        return;
      }
      formKey.currentState!.save();
      bool success = false;
      try {
        success = await authProvider.signIn(
          studentId!,
          password!,
        );
      } on FirebaseAuthException catch (st) {
        if (!context.mounted) {
          return;
        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              st.toString(),
            ),
          ),
        );
        return;
      }
      if (success) {
        if (!context.mounted) {
          return;
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const TabsScreen(),
          ),
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/kfupm.jpg',
                alignment: Alignment.center,
                height: 128,
                width: 128,
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    SizedBox(
                        width: 256,
                        child: LoginPageTitleTexts(
                          titleText:
                              'King Fahd University of Petroleum and Minerals',
                        )),
                    SizedBox(
                      width: 256,
                      child: LoginPageTitleTexts(
                        titleText: 'جامعة الملك فهد للبترول والمعادن',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: LoginPageTextField(
                  hint: 'Student ID',
                  icon: Icons.person_4,
                  validator: (newValue) {
                    if (newValue == null || newValue.length < 8) {
                      return 'ID must be at least 9 characters long';
                    }
                    return null;
                  },
                  onSaved: (p0) {
                    studentId = '$p0@kfupm.edu.sa';
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: LoginPageTextField(
                  hint: 'Password',
                  validator: (newValue) {
                    if (newValue == null || newValue.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  onSaved: (p0) {
                    password = p0;
                  },
                  obsecuredText: true,
                  icon: Icons.lock,
                  suffix: SizedBox(
                    width: 4,
                    child: MaterialButton(
                      height: 4,
                      child: const Icon(
                        Icons.remove_red_eye_rounded,
                        size: 24,
                      ),
                      // show password on press
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    // Authenticate user
                    onPressed: () async {
                      authenticateUser();
                    },
                    child: const Text('SIGN IN'),
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
