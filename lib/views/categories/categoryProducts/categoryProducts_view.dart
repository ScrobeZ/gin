import 'package:flutter/material.dart';
import 'package:gin/config/helpers/translations.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/categories/categoryProducts/categoryProducts_viewmodel.dart';
import 'package:gin/views/home/widgets/product_widget.dart';

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView({super.key, required this.category});

  final String category;

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  final CategoryProductsViewModel model = CategoryProductsViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
      child: FutureBuilder(
        future: model.getProducts(widget.category),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.done)
              ? _buildBody()
              : const Center(
                  child: CircularProgressIndicator(
                    color: primaryBlack,
                  ),
                );
        },
      ),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categorías > ${Translations().translateCategory(widget.category)}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Wrap(
              spacing: 20.0,
              runSpacing: 25.0,
              children: [..._buildProductsList()],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProductsList() {
    List<Widget> widgets = [];

    for (var i = 0; i < model.products!.length; i++) {
      widgets.add(
        ProductWidget(
          productName: model.products![i].title,
          productPrice: model.products![i].price,
          image: Image.network(model.products![i].image),
        ),
      );
    }

    return widgets;
  }
}
