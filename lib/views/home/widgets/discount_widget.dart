import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    super.key,
    required this.discount,
    required this.limitedEdition,
    required this.onPressed,
    required this.image,
  });

  final Image image;
  final String discount;
  final bool limitedEdition;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: blueMarine,
      height: size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.white,
              child: image,
              height: 150,
              width: 150,
            ),
            horizontalSmallGap,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  discount,
                  style: const TextStyle(fontSize: 20),
                ),
                (limitedEdition)
                    ? const Text(
                        'Edición limitada',
                        style: TextStyle(fontSize: 14),
                      )
                    : Container(),
                CustomTextButton(
                  color: pink,
                  fontSize: 11,
                  heigth: 30,
                  width: 125,
                  text: 'Añadir a carrito',
                  textColor: Colors.white,
                  onPressed: onPressed,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
