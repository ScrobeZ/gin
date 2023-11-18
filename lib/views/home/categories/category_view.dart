import 'package:flutter/material.dart';
import 'package:gin/views/home/categories/category_viewmodel.dart';
import 'package:gin/views/home/widgets/category_widget.dart';
// import 'package:gin/constants/colors.dart';
// import 'package:gin/constants/gaps.dart';
// import 'package:gin/views/widgets/custom_text_button.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final CategoryViewModel model = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    
    // final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      
      child:SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Categorías',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
                    // Spacing
        const SizedBox(height: 30),
        Wrap(
          spacing: 8.0,
          runSpacing: 25.0,
          children: [
            CategoryWidget(
              name: 'Ropa',
              onPressed: () {
                model.navigateToCategoryProducts(context);
              },
            ),
            CategoryWidget(
              name: 'Hogar',
              onPressed: () {},
            ),
            CategoryWidget(
              name: 'Tecnología',
              onPressed: () {},
            ),
            CategoryWidget(
              name: 'Linea blanca',
              onPressed: () {},
            ),
            CategoryWidget(
              name: 'Ropa',
              onPressed: () {},
            ),
            CategoryWidget(
              name: 'Videojuegos',
              onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}
