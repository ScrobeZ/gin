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
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildAppBar(size),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: _buildBody(),
          )),
    );
  }

  AppBar _buildAppBar(Size size) {
    return AppBar(
      backgroundColor: Colors.purple,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: const Text("Gin"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_rounded,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  _buildBody() {
    return Row(
      children: [
        SizedBox(
            height: 250,
            width: 350,
            child: Center(child: Image.asset('assets/images/audi.jpeg'))),
        const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Audifonos inalambricos", style: TextStyle(fontSize: 15)),
              Text("Precio"),
              Text("\$70", style: TextStyle(fontSize: 15)),
              Text("Descuento"),
              Text("20%", style: TextStyle(fontSize: 15)),
            ]),
        Column(
          children: [
            CustomTextButton(
              text: 'AÑADIR AL CARRO',
              onPressed: () {},
              heigth: 20,
              color: Colors.pink.shade100,
              fontSize: 17,
              width: 100,
            )
          ],
        ),
      ],
    );

    /*CustomTextButton(
          text: 'AÑADIR AL CARRO',
          onPressed: () {},
          heigth: 20,
          color: Colors.pink.shade100,
          fontSize: 17,
          width: 100,
        ),*/
  }
}
