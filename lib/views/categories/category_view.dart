import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/categories/category_viewmodel.dart';
import 'package:gin/views/categories/widgets/category_widget.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final CategoryViewModel model = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    model.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
      child: FutureBuilder(
        future: model.getCategories(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.done)
              ? _buildBody(context)
              : const Center(
                  child: CircularProgressIndicator(
                    color: primaryBlack,
                  ),
                );
        },
      ),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
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
          Center(
            child: Wrap(
              spacing: 30.0,
              runSpacing: 25.0,
              children: [..._buildCategoriesList()],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCategoriesList() {
    List<Widget> widgets = [];

    for (var i = 0; i < model.categoriesES!.length; i++) {
      widgets.add(
        CategoryWidget(
          name: model.categoriesES![i],
          onPressed: () {
            model.navigateToCategoryProducts(context, i);
          },
        ),
      );
    }

    return widgets;
  }
}
