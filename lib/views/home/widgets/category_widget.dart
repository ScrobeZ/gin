import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.name,
    required this.onPressed,
  });

  final String name;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: blueMarine,
      height: size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: primaryBlack,
              height: 115,
              width: 100,
            ),
          horizontalSmallGap,
          horizontalSmallGap,
          Text(
            name,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          CustomTextButton(
            color: pink,
            fontSize: 11,
            heigth: 30,
            width: 125,
            text: 'Ir a categoria',
            textColor: Colors.white,
            onPressed: onPressed,
          )
          ],
        ),
      ),
    );
  }
}
