import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.name,
    required this.price,
    required this.onPressed,
  });

  final String name;
  final int price;
  final Function() onPressed;

@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Container(
    color: blueMarine,
    height: size.height * 0.3,
    child: Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column( // Use Row instead of Column
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: primaryBlack,
            height: 150,
            width: 200,
          ),
          horizontalSmallGap,
          horizontalSmallGap,
          Row( // Wrap the Text widgets in a Column
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Text(
                '\$ $price',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    )
  );
}
}