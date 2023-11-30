import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/home/drawer/drawer_view_model.dart';
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
          _buildDrawerButton(
            context,
            'Inicio',
            model.isHome,
            Icons.home_rounded,
            () {
              model.navigateToHome(context);
            },
          ),
          verticalBigGap,
          _buildDrawerButton(
            context,
            'Categoria',
            model.isCategory,
            Icons.apps_rounded,
            () {
              model.navigateToCategory(context);
            },
          )
        ],
      ),
    );
  }

  GestureDetector _buildDrawerButton(
    BuildContext context,
    String text,
    bool enable,
    IconData iconData,
    Function() onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 300,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                iconData,
                size: 30,
                color: Colors.white,
              ),
              horizontalBigGap,
              Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
