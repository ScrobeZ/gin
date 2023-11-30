import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/home/drawer/drawer_view_model.dart';
import 'package:gin/views/widgets/custom_text_button.dart';
import 'package:gin/constants/gaps.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  final DrawerViewModel model = DrawerViewModel();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: double.infinity,
      color: primaryBlack,
      child: Column(
        children: [
          verticalMicroGap,
          verticalMicroGap,
          const Text(
            'Bienvenido',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 40,
                color: Colors.white,
              ),
              Text(
                'Guillermo Castillo Montoya',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          verticalBigGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.home_rounded,
                color: Colors.white,
                size: 30,
              ),
              CustomTextButton(
                text: 'Inicio',
                fontSize: 20,
                textColor: Colors.white,
                color: Colors.transparent,
                heigth: 50,
                width: 150,
                onPressed: () {
                  model.navigateToHome(context);
                },
              ),
            ],
          ),
          verticalBigGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.apps,
                color: Colors.white,
                size: 30,
              ),
              CustomTextButton(
                text: 'Categorias',
                fontSize: 20,
                textColor: Colors.white,
                color: Colors.transparent,
                heigth: 50,
                width: 150,
                onPressed: () {
                  model.navigateToCategory(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
