import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';
import 'package:gin/views/home/widgets/search_product_widget.dart';
import 'package:go_router/go_router.dart';

class SearchProductDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar producto en GIN';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    final fakeStoreServices = FakeStoreService();

    return FutureBuilder(
      future: fakeStoreServices.getProductByNameTest(query),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return _showProducts(snapshot.data, context);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 4,
            color: primaryBlack,
          ));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('No se ha realizado busqueda'));
  }

  Widget _showProducts(List<Product> products, BuildContext context) {
    List<Widget> productWidgets = [];

    for (int i = 0; i < products.length; i++) {
      final prod = products[i];
      productWidgets.add(
        SearchProductWidget(
          title: prod.title,
          image: prod.image,
          onPressed: () {
            context.pop();
            context.push('$productRoute/${prod.id}');
          },
        ),
      );
    }
    return ListView(
      children: productWidgets,
    );
  }
}
