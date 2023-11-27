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
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 115,
              width: 100,
              child: _categoryImage(),
            ),
            horizontalSmallGap,
            horizontalSmallGap,
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            CustomTextButton(
              color: pink,
              fontSize: 11,
              heigth: 30,
              width: 120,
              text: 'Ir a categoria',
              textColor: Colors.white,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }

  Image _categoryImage() {
    switch (name) {
      case 'Electrónicos':
        return Image.asset('assets/images/categories/electronicos.jpg',
            fit: BoxFit.contain);
      case 'Joyería':
        return Image.asset('assets/images/categories/joyeria.jpg',
            fit: BoxFit.contain);
      case 'Ropa para hombres':
        return Image.asset('assets/images/categories/ropa_hombres.jpg',
            fit: BoxFit.contain);
      case 'Ropa para mujeres':
        return Image.asset('assets/images/categories/ropa_mujeres.jpg',
            fit: BoxFit.contain);
      default:
        return Image.asset('assets/images/gin_logo.png', fit: BoxFit.contain);
    }
  }
}
