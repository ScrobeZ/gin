import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/models/product.dart';
import 'package:gin/views/shopping_cart/shopping_cart_view_model.dart';
import 'package:gin/views/widgets/custom_snackbar.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class ShoppingCartView extends StatefulWidget with CustomSnackbar {
  const ShoppingCartView({super.key});

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  final ShoppingCartViewModel model = ShoppingCartViewModel();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Carrito de compras',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: model.checkIfIsthereProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: (snapshot.data!)
                  ? Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.7,
                          child: ListView.builder(
                            itemCount: model.frecuenciaDeIds.length,
                            itemBuilder: (context, index) {
                              return ProductTile(
                                  product: model.products[index],
                                  quantity: model.frecuenciaDeIds[
                                          model.products[index].id] ??
                                      1,
                                  size: size);
                            },
                          ),
                        ),
                        CustomTextButton(
                          color: primaryBlack,
                          textColor: Colors.white,
                          text: 'Comprar',
                          onPressed: () {
                            setState(
                              () {
                                model.purchase();
                                model.navigateToHome(context);
                                return widget.toShowSnackBarCustom(
                                  context,
                                  color: Colors.green,
                                  snackBarContent: const Center(
                                    child: Text('¡Compra exitosa!'),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      ],
                    )
                  : const Text('No hay productos'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryBlack,
              ),
            );
          }
        },
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.size,
  });

  final Product product;
  final int quantity;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.image,
        fit: BoxFit.contain,
        height: 50,
        width: 50,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              product.title,
              style: const TextStyle(fontSize: 12),
              maxLines: 3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('$quantity'),
            ],
          ),
        ],
      ),
      subtitle: Text(
        '\$${product.price}',
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
