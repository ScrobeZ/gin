import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/home/dashboard/dashboard_viewmodel.dart';
import 'package:gin/views/home/widgets/discount_widget.dart';
import 'package:gin/views/home/widgets/product_widget.dart';

class DashboardView extends StatefulWidget {
  DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardViewModel model = DashboardViewModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: FutureBuilder(
        future: model.getProducts(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.done)
              ? Column(
                  children: [
                    DiscountWidget(
                      image: Image.network(model.products![10].image),
                      discount: '50% DE\nDESCUENTO',
                      limitedEdition: true,
                      onPressed: () {},
                    ),
                    verticalBigGap,
                    DiscountWidget(
                      image: Image.network(model.products![15].image),
                      discount: '40% DE\nDESCUENTO',
                      limitedEdition: true,
                      onPressed: () {},
                    ),
                    verticalBigGap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            model.navigateToProduct(context);
                          },
                          child: ProductWidget(
                            productName: model.products![0].title,
                            productPrice: model.products![0].price,
                            image: Image.network(model.products![0].image),
                          ),
                        ),
                        ProductWidget(
                          productName: model.products![1].title,
                          productPrice: model.products![1].price,
                          image: Image.network(model.products![1].image),
                        ),
                      ],
                    )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: primaryBlack,
                  ),
                );
        },
      ),
    );
  }
}
