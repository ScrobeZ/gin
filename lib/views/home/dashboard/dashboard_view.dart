import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/home/dashboard/dashboard_viewmodel.dart';
import 'package:gin/views/home/widgets/discount_widget.dart';
import 'package:gin/views/home/widgets/product_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

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
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      DiscountWidget(
                        image: Image.network(model.products![1].image),
                        discount: '50% DE\nDESCUENTO',
                        limitedEdition: true,
                        onPressed: () {
                          model.addCart(model.products![1].id);
                        },
                      ),
                      verticalBigGap,
                      DiscountWidget(
                        image: Image.network(model.products![0].image),
                        discount: '40% DE\nDESCUENTO',
                        limitedEdition: true,
                        onPressed: () {
                          model.addCart(model.products![0].id);
                        },
                      ),
                      verticalBigGap,
                      Wrap(
                        spacing: 20.0,
                        runSpacing: 25.0,
                        children: [..._buildProductsList()],
                      )
                    ],
                  ),
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

  List<Widget> _buildProductsList() {
    List<Widget> widgets = [];

    for (var i = 2; i < model.products!.length - 2; i++) {
      widgets.add(
        ProductWidget(
          onPressed: () {
            model.navigateToProduct(context, model.products![i].id);
          },
          productName: model.products![i].title,
          productPrice: model.products![i].price,
          image: Image.network(model.products![i].image),
        ),
      );
    }

    return widgets;
  }
}
