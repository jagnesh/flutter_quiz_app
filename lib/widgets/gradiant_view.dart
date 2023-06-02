import 'package:flutter/material.dart';

class GradiantView extends StatelessWidget {
  const GradiantView({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.pink,
          Colors.pinkAccent,
        ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}
