import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/widgets/custom_text_button.dart';
import 'package:gin/views/widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBlack,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        backgroundColor: primaryBlack,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildBody(size),
        ),
      ),
    );
  }

  Column _buildBody(Size size) {
    return Column(
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
        CustomTextButton(text: 'REGISTRAR', onPressed: () {}),
      ],
    );
  }
}
