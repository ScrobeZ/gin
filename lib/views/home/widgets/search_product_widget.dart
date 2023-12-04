import 'package:flutter/material.dart';

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
          child: 
          Column(
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    title
                  )
                ),
              ),
              Image.network(
                image,
                // fit: BoxFit.cover,
                height: 130.0,
                width: 250.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    onPressed;
                  },
                  child: const Text("Ir a producto"),
                ),
              ),
            ],
          ),
        );
  }
}