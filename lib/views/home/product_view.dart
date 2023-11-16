import 'package:flutter/material.dart';
import 'package:gin/views/home/produc.dart';
import 'package:gin/views/widgets/custom_text_button.dart';
import '../../constants/colors.dart';

class ProductoView extends StatefulWidget {
  const ProductoView({super.key});

  @override
  State<ProductoView> createState() => _ProductoViewState();
}

class _ProductoViewState extends State<ProductoView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: primaryBlack,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          products[0].title,
          selectionColor: Colors.white,
        ),
      ),
      body: const ListProductos(),
    ));
  }
}

class ListProductos extends StatelessWidget {
  const ListProductos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10.0),
              height: 380,
              width: 350,
              decoration: BoxDecoration(
                color: products[0].color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(products[0].image)),
          Text(
            products[0].title,
            selectionColor: products[0].color,
            style: const TextStyle(color: primaryBlack),
          ),
          const Text("15, 000",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal)),
          Text(
            products[0].description,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Column(
            children: [
              CustomTextButton(text: 'Comprar', onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
