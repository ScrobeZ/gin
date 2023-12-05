import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
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
          padding: const EdgeInsets.all(24.0),
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
        verticalBigGap,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              product.title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            verticalBigGap,
            Text(
              product.description,
            ),
            verticalBigGap,
            const Text("Precio"),
            Text(
              "\$${product.price}",
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        verticalBigGap,
        CustomTextButton(
          text: 'AÑADIR AL CARRO',
          onPressed: () {
            model.addCart(product.id);
          },
          heigth: 50,
          color: Colors.pink.shade100,
          fontSize: 14,
          width: 150,
        ),
      ],
    );
  }
}
