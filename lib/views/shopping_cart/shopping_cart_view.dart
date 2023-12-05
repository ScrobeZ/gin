import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/shopping_cart/shopping_cart_view_model.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class ShoppingCartView extends StatefulWidget {
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
        title: const Text(
          'Carrito de compras',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: model.checkIfIstherProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: (snapshot.data!)
                  ? Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.7,
                          child: ListView.builder(
                            itemCount: model.products.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image.network(
                                  model.products[index].image,
                                  fit: BoxFit.contain,
                                  height: 50,
                                  width: 50,
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.4,
                                      child: Text(
                                        model.products[index].title,
                                        style: const TextStyle(fontSize: 12),
                                        maxLines: 3,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          style: const ButtonStyle(
                                            minimumSize:
                                                MaterialStatePropertyAll(
                                                    Size(5, 5)),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.red),
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.remove,
                                            color: primaryBlack,
                                            size: 15,
                                          ),
                                        ),
                                        Text('${1}'),
                                        IconButton(
                                          style: const ButtonStyle(
                                            minimumSize:
                                                MaterialStatePropertyAll(
                                                    Size(5, 5)),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.green),
                                          ),
                                          padding: const EdgeInsets.all(1),
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: primaryBlack,
                                            size: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  '\$${model.products[index].price}',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              );
                            },
                          ),
                        ),
                        CustomTextButton(
                            color: primaryBlack,
                            textColor: Colors.white,
                            text: 'Comprar',
                            onPressed: () {
                              setState(() {
                                model.purchase();
                              });
                            })
                      ],
                    )
                  : Text('No hay productos'),
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
