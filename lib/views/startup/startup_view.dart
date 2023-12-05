import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/startup/startup_viewmodel.dart';

class StartUpView extends StatefulWidget {
  const StartUpView({super.key});

  @override
  State<StartUpView> createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  final model = StartUpViewModel();

  @override
  initState() {
    super.initState();
    model.checkUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Scaffold _buildBody() {
    return Scaffold(
      backgroundColor: primaryBlack,
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
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
