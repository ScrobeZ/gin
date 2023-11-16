import 'package:flutter/material.dart';

class Product {
  final String image;
  final String title;
  final String description;
  final int id;
  final int price;
  final int size;
  final Color color;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color});
}

List<Product> products = <Product>[
  Product(
      id: 1,
      title: "Celular",
      price: 232,
      size: 60,
      description: "Lorem Ipsum es simplemente el texto de "
          "relleno de las imprentas y archivos de texto,"
          "Lorem Ipsum ha sido el texto de relleno"
          "estándar de las industrias desde el año 1500,"
          " cuando un impresor (N. del T.",
      image: "assets/images/image1.jpeg",
      color: Colors.cyan),
];
