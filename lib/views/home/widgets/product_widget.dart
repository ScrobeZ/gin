import 'package:flutter/material.dart';
import 'package:gin/constants/gaps.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.image,
      required this.onPressed});

  final Image image;
  final String productName;
  final double productPrice;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 200,
        width: 135,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 125,
              width: 130,
              child: image,
            ),
            verticalMicroGap,
            Text(
              productName,
              style: const TextStyle(fontSize: 14, height: 1),
              maxLines: 3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$ $productPrice',
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
