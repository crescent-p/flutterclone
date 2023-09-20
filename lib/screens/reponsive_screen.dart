import 'package:flutter/material.dart';

import '../consts/screen_size.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({super.key, required this.mobile, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= webscreensize) {
        return desktop;
      } else {
        return mobile;
      }
    });
  }
}
