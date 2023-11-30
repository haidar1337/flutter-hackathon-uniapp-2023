import 'package:flutter/material.dart';
import 'package:projectname/common_widgets/login_page_textfield.dart';
import 'package:projectname/common_widgets/login_page_title_texts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: LoginPageTextField(
                hint: 'Student ID',
                icon: Icons.person_4,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LoginPageTextField(
                hint: 'Password',
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
                  onPressed: () {},
                  child: const Text('SIGN IN'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
