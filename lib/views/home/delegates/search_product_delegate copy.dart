
import 'package:flutter/material.dart';
import 'package:gin/models/product.dart';
import 'package:gin/services/fake_store_services.dart';

class SearchProductDelegate extends SearchDelegate{

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
      future: fakeStoreServices.getProductByNameTest( query ),
      builder: ( _ , AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return _showProducts(snapshot.data);
        } else {
          return const CircularProgressIndicator(strokeWidth: 4);
        }
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
  return const Text('No se ha realizado busqueda');  
  }

  Widget _showProducts(List<Product> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, i) {
        final prod = products[i];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: 
          
          Column(
            children: [
              ListTile(
                title: Text(prod.title),
              ),
              Image.network(
                prod.image,
                fit: BoxFit.cover,
                height: 130.0,
                width: 250.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text("Ir a producto"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  }