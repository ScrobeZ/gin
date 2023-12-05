import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/models/product.dart';
import 'package:gin/views/product/product_view_model.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key, required this.id});
  final int id;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final ProductViewModel model = ProductViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: model.getProduct(widget.id),
            builder: (context, snapshot) {
              return (snapshot.hasData)
                  ? _buildBody(snapshot.data!)
                  : const Center(
                      child: CircularProgressIndicator(
                        color: primaryBlack,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(Product product) {
    return Column(
      children: [
        Center(
          child: Image.network(
            product.image,
            height: 200,
            width: 200,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              product.title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              product.description,
            ),
            Text("Precio",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
            Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        CustomTextButton(
          text: 'AÑADIR AL CARRO',
          onPressed: () {},
          heigth: 50,
          color: pink,
          fontSize: 14,
          width: 151,
        ),
        ElevatedButton.icon(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                      title: const Text("Favoritos"),
                      content: const Text("Agregado a favoritos")));
            },
            icon: const Icon(Icons.favorite_border_outlined),
            label: const Text('Favorito')),
      ],
    );
  }
}
