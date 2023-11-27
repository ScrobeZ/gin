import 'package:flutter/material.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: _buildBody(),
          )),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 350,
          child: Center(
            child: Image.asset('assets/images/audi.jpeg'),
          ),
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Audifonos inalambricos",
              style: TextStyle(fontSize: 15),
            ),
            Text("Precio"),
            Text("\$70", style: TextStyle(fontSize: 15)),
            Text("Descuento"),
            Text("20%", style: TextStyle(fontSize: 15)),
          ],
        ),
        Column(
          children: [
            CustomTextButton(
              text: 'AÑADIR AL CARRO',
              onPressed: () {},
              heigth: 50,
              color: Colors.pink.shade100,
              fontSize: 14,
              width: 150,
            )
          ],
        ),
      ],
    );
  }
}
