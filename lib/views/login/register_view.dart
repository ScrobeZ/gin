import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/widgets/custom_text_button.dart';
import 'package:gin/views/widgets/custom_text_form_field.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildBody(size),
        ),
      ),
    );
  }

  Column _buildBody(Size size) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
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
          hintText: 'Nombre completo',
        ),
        verticalBigGap,
        const CustomTextFormField(
          hintText: 'Email',
        ),
        verticalBigGap,
        const CustomTextFormField(
          hintText: 'Contraseña',
        ),
        verticalBigGap,
        const CustomTextFormField(
          hintText: 'Confirme contraseña',
        ),
        verticalBigGap,
        verticalBigGap,
        const CustomTextButton(text: 'REGISTRAR'),

      verticalBigGap,
      verticalBigGap,
      verticalBigGap,
      const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
              '¿Ya tienes una cuenta? Inicie sesión',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )
          ],
        ),
      ],
    );
  }
}
