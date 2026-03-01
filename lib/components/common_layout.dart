import 'package:flutter/material.dart';
import 'top_header.dart';
import 'navbar.dart';
import 'footer.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;

  const CommonLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TopHeader(),
          const NavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [child, const Footer()]),
            ),
          ),
        ],
      ),
    );
  }
}
