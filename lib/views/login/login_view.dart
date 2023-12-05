import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/login/login_view_model.dart';
import 'package:gin/views/widgets/custom_snackbar.dart';
import 'package:gin/views/widgets/custom_text_button.dart';
import 'package:gin/views/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget with CustomSnackbar {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LoginViewModel model = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryBlack,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: _buildBody(size, model),
          ),
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
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: _emailController,
                hintText: 'Correo eléctronico',
              ),
              verticalBigGap,
              CustomTextFormField(
                controller: _passwordController,
                isPassword: true,
                hintText: 'Contraseña',
              ),
            ],
          ),
        ),
        verticalBigGap,
        verticalBigGap,
        CustomTextButton(
          text: 'INICIAR SESIÓN',
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await model
                  .signIn(_emailController.text, _passwordController.text)
                  .then(
                (value) {
                  if (value is UserCredential) {
                    model.navigateToHome(context);
                  } else {
                    return widget.toShowSnackBarCustom(
                      context,
                      color: Colors.red,
                      snackBarContent: Center(
                        child: Text('$value'),
                      ),
                    );
                  }
                },
              );
            }
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
