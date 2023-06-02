import 'package:flutter/material.dart';

class GradiantView extends StatelessWidget {
  const GradiantView({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 116, 124, 235),
          Color.fromARGB(255, 3, 144, 187),
        ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}
