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
              future: model.getProduct(1),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(snapshot.data!.image,
                                fit: BoxFit.fill, height: 50),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: Text(
                                    snapshot.data!.title,
                                    style: const TextStyle(fontSize: 12),
                                    maxLines: 3,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      style: const ButtonStyle(
                                        minimumSize: MaterialStatePropertyAll(
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
                                    Text('${model.productLength}'),
                                    IconButton(
                                      style: const ButtonStyle(
                                        minimumSize: MaterialStatePropertyAll(
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
                              '\$${snapshot.data!.price}',
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        color: primaryBlack,
                      ));
              },
            )
          : const Center(
              child: Text('Aun no hay productos'),
            ),
    );
  }
}
