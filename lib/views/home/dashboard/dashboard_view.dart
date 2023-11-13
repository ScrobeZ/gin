import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/home/dashboard/dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final DashboardViewModel model = DashboardViewModel();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: primaryBlack,
          width: 200,
          height: 100,
        )
      ],
    );
  }
}
