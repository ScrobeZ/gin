import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gin/constants/strings.dart';
import 'package:gin/services/auth_services.dart';
import 'package:go_router/go_router.dart';

class DrawerViewModel {
  bool isHome = true;
  bool isCategory = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<void> logOut(BuildContext context) async {
    await _auth.instance.signOut().then((value) {
      context.go(startUpRoute);
    });
  }

  Future<String> getFullName() async {
    var name = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(_auth.instance.currentUser!.uid)
        .get()
        .then((value) => value['completeName']);
    return name;
  }

  navigateToCategory(BuildContext context) {
    context.push(categoryRoute);
  }

  navigateToHome(BuildContext context) {
    context.push(dashboardRoute);
  }
}
