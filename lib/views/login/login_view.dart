import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/gin_logo.png',
                  fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
