import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/constants/gaps.dart';
import 'package:gin/views/home/dashboard/dashboard_viewmodel.dart';
import 'package:gin/views/home/widgets/discount_widget.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final DashboardViewModel model = DashboardViewModel();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        children: [
          DiscountWidget(
            discount: '50% DE\nDESCUENTO',
            limitedEdition: true,
            onPressed: () {},
          ),
          verticalBigGap,
          DiscountWidget(
            discount: '40% DE\nDESCUENTO',
            limitedEdition: true,
            onPressed: () {},
          ),
          verticalBigGap,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProductWidget(
                productName: 'Licuadora',
                productPrice: '\$60',
              ),
              ProductWidget(
                productName: 'Camara Fujifilm',
                productPrice: '\$60',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.productName,
    required this.productPrice,
  });

  final String productName;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 125,
          width: 130,
          color: primaryBlack,
        ),
        Text(
          productName,
          style: const TextStyle(fontSize: 16),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            productPrice,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
