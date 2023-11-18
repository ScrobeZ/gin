import 'package:flutter/material.dart';
import 'package:gin/views/home/categoryProducts/categoryProducts_viewmodel.dart';
import 'package:gin/views/home/widgets/product_widget.dart';
// import 'package:gin/constants/colors.dart';
// import 'package:gin/constants/gaps.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class CategoryProductsView extends StatelessWidget {
  CategoryProductsView({super.key});

  final CategoryProductsViewModel model = CategoryProductsViewModel();

  @override
  Widget build(BuildContext context) {
    
    // final size = MediaQuery.of(context).size;
    return Padding(
    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      child:SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          const Text(
            'Categorías > Ropa',
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
            ProductsWidget(
              name: 'Camisa Vintage',
              price: 500,
              onPressed: () {},
            ),
            ProductsWidget(
              name: 'Tenis Jordan',
              price: 1050,
              onPressed: () {},
            ),
            ProductsWidget(
              name: 'Camisa Fauget',
              price: 750,
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
