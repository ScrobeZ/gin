import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gin/config/helpers/text_helpers.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/register/register_view_model.dart';
import 'package:gin/views/widgets/custom_snackbar.dart';
import 'package:gin/views/widgets/custom_text_button.dart';
import 'package:gin/views/widgets/custom_text_form_field.dart';
import 'package:gin/views/widgets/validators.dart';

class RegisterView extends StatefulWidget
    with CustomSnackbar, TextHelpers, CustomValidators {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel model = RegisterViewModel();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBlack,
          title: const Text('Iniciar sesión',
              style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
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

  Column _buildBody(Size size, RegisterViewModel model) {
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
        Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              verticalBigGap,
              CustomTextFormField(
                keyboardType: TextInputType.name,
                hintText: 'Nombre completo',
                controller: _usernameController,
              ),
              verticalBigGap,
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                controller: _emailController,
                validator: widget.validateEmail,
              ),
              verticalBigGap,
              CustomTextFormField(
                isPassword: true,
                hintText: 'Contraseña',
                controller: _passwordController,
              ),
              verticalBigGap,
              CustomTextFormField(
                isPassword: true,
                hintText: 'Confirme contraseña',
                controller: _passwordConfirmController,
              ),
              verticalBigGap,
              verticalBigGap,
            ],
          ),
        ),
        CustomTextButton(
          text: 'REGISTRAR',
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              model
                  .signUp(_usernameController.text, _emailController.text,
                      _passwordController.text, _passwordConfirmController.text)
                  .then((value) {
                if (value is User) {
                  model.navigateToLogin(context);
                  return widget.toShowSnackBarCustom(
                    context,
                    color: Colors.green,
                    snackBarContent: const Center(
                      child: Text('¡Usuario registrado exitosamente!'),
                    ),
                  );
                } else {
                  return widget.toShowSnackBarCustom(
                    context,
                    color: Colors.red,
                    snackBarContent: Center(
                      child: Text('$value'),
                    ),
                  );
                }
              });
            } else {
              return widget.toShowSnackBarCustom(
                context,
                color: Colors.red,
                snackBarContent: const Center(
                  child: Text('Completa correctamente el formulario'),
                ),
              );
            }

            //if (_formKey.currentState!.validate()) {
            //  if (model.checkConfirmPassword(_passwordController.text,
            //      _passwordConfirmController.text)) {
            //    await model
            //        .signUp(_usernameController.text, _emailController.text,
            //            _passwordController.text)
            //        .then(
            //      (value) {
            //        if (value is User) {
            //          model.navigateToHome(context);
            //          return widget.toShowSnackBarCustom(
            //            context,
            //            color: Colors.green,
            //            snackBarContent: const Center(
            //              child: Text('¡Usuario registrado exitosamente!'),
            //            ),
            //          );
            //        } else {
            //          return widget.toShowSnackBarCustom(
            //            context,
            //            color: Colors.red,
            //            snackBarContent: Center(
            //              child: Text('$value'),
            //            ),
            //          );
            //        }
            //      },
            //    );
            //  } else {
            //    return widget.toShowSnackBarCustom(
            //      context,
            //      color: Colors.red,
            //      snackBarContent: const Center(
            //        child: Text('Las contraseñas no coinciden'),
            //      ),
            //    );
            //  }
            //} else {
            //
            //
            //
            //
            //
            //
            //
            //}
          },
        ),
      ],
    );
  }
}
