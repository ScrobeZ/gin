import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/startup/startup_viewmodel.dart';

class StartUpView extends StatefulWidget {
  const StartUpView({super.key});

  @override
  State<StartUpView> createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  @override
  Widget build(BuildContext context) {
    final model = StartUpViewModel();
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/gin_logo.png',
                  fit: BoxFit.contain),
            ),
            const SizedBox(
              height: 18.0,
            ),
            GestureDetector(
              onTap: () {
                model.navigateToLogin(context);
              },
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
