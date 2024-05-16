import 'package:flutter/material.dart';

class BodyTemplate extends StatelessWidget {
  final Widget child;

  const BodyTemplate({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: child,
        ),
      ),
    );
  }
}

