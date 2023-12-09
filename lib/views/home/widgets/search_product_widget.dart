import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/widgets/custom_text_button.dart';

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
  });

  final String title;
  final image;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(5.0),
      color: primaryBlack,
      child: Column(
        children: [
          ListTile(
            title: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Image.network(
              image,
              height: 130.0,
              width: 250.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextButton(
              text: 'Ir al producto',
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
