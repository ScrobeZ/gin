
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'favoritos_view_model.dart';

class CategoFavs extends StatefulWidget {
  const CategoFavs({super.key});

  @override
  State<CategoFavs> createState() => _CatFavoritos();
}

class _CatFavoritos extends State<CategoFavs> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
        title: const Text(
          'Favoritos',
          style: TextStyle(color: Colors.white),
        ),));
       }
}