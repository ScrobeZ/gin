import 'package:flutter/material.dart';
import 'package:gin/constants/colors.dart';
import 'package:gin/views/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.child});
  final Widget child;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel model = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(size),
        body: widget.child,
      ),
    );
  }

  AppBar _buildAppBar(Size size) {
    return AppBar(
      backgroundColor: primaryBlack,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: _buildSearchBar(size),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_rounded,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  SizedBox _buildSearchBar(Size size) {
    return SizedBox(
      width: size.width * 0.60,
      height: 30,
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          fillColor: Colors.white,
          filled: true,
          hintText: '¿Algo en especifico?',
          hintStyle: TextStyle(color: primaryBlack, fontSize: 12),
        ),
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
