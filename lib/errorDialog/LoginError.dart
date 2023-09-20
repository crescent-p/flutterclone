import 'package:flutter/material.dart';

class LoginError extends StatelessWidget {
  final String error;
  const LoginError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return ErrorWidget(error);
  }
}
