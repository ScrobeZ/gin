import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/colors.dart';
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
      backgroundColor: primaryBlack,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: _buildSearchBar(size),
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

  SizedBox _buildSearchBar(Size size) {
    return SizedBox(
      width: size.width * 0.60,
      height: 30,
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          fillColor: Colors.white,
          filled: true,
          hintText: '¿Algo en especifico?',
          hintStyle: TextStyle(color: primaryBlack, fontSize: 12),
        ),
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  _buildBody() {
    return Center(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
            height: 500,
            width: 450,
            child: Center(child: Image.asset('assets/images/audi.jpeg'))),
        const Column(
              children: <Widget>[
              Text("Audifonos inalambricos", textAlign: TextAlign.right,  style: TextStyle(fontSize: 18)),
              Text("Precio", textAlign: TextAlign.right, style: TextStyle(fontSize: 17)),
              Text("\$70", textAlign: TextAlign.left, style: TextStyle(fontSize: 25)),
              Text("Descuento", textAlign: TextAlign.left, style: TextStyle(fontSize: 25)),
              Text("20%",textAlign: TextAlign.right, style: TextStyle(fontSize: 20)),
              
            ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextButton(
              text: 'AÑADIR AL CARRO', 
              onPressed: () {},
              heigth: 50,
              color: pink,
              fontSize: 12,
              width: 100,
            )
          ],
        ),
        ],
      ),
      
    );
  }
}
