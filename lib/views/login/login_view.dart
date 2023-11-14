import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/login/login_view_model.dart';
import 'package:gin/views/widgets/custom_text_button.dart';
import 'package:gin/views/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel model = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryBlack,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildBody(size, model),
        ),
      ),
    );
  }

  Column _buildBody(Size size, LoginViewModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: Image.asset(
            'assets/images/gin_logo.png',
            fit: BoxFit.contain,
          ),
        ),
        verticalBigGap,
        const CustomTextFormField(
          hintText: 'Usuario',
        ),
        verticalBigGap,
        const CustomTextFormField(
          hintText: 'Contraseña',
        ),
        verticalBigGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              checkColor: Colors.black,
              fillColor: const MaterialStatePropertyAll(Colors.white),
              value: model.rememberPassword,
              onChanged: (value) => setState(
                () {
                  model.rememberPasswordChanged();
                },
              ),
            ),
            GestureDetector(
              onTap: () => setState(
                () {
                  model.rememberPasswordChanged();
                },
              ),
              child: const Text(
                'Recordar contraseña',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
        verticalBigGap,
        CustomTextButton(
          text: 'INICIAR SESIÓN',
          onPressed: () {
            model.navigateToHome(context);
          },
        ),
        verticalBigGap,
        verticalBigGap,
        verticalBigGap,
        verticalBigGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(
                () {
                  model.navigateToRegister(context);
                },
              ),
              child: const Text(
                'Registrarse',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => setState(
                () {
                  //model.rememberPasswordChanged();
                },
              ),
              child: const Text(
                'Olvide mi\ncontraseña',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
