import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: double.infinity,
      color: primaryBlack,
      child: Column(children: []),
    );
  }
}
