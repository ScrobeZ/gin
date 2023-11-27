import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/home/shopping_cart/shopping_cart_view_model.dart';

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
    return Container(
      child: !model.isAnyProducts
          ? FutureBuilder(
              future: model.getCart(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: ListView.builder(
                      itemCount: model.cart.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            snapshot.data![index].image,
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
                                  snapshot.data![index].title,
                                  style: const TextStyle(fontSize: 12),
                                  maxLines: 3,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    style: const ButtonStyle(
                                      minimumSize:
                                          MaterialStatePropertyAll(Size(5, 5)),
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.red),
                                    ),
                                    padding: const EdgeInsets.all(1),
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: primaryBlack,
                                      size: 15,
                                    ),
                                  ),
                                  Text(
                                      '${model.cart.products[index].quantity}'),
                                  IconButton(
                                    style: const ButtonStyle(
                                      minimumSize:
                                          MaterialStatePropertyAll(Size(5, 5)),
                                      backgroundColor: MaterialStatePropertyAll(
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
                            '\$${snapshot.data![index].price}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryBlack,
                    ),
                  );
                }
              },
            )
          : const Center(
              child: Text('Aun no hay productos'),
            ),
    );
  }
}
