import 'package:flutter/material.dart';

class GradiantView extends StatelessWidget {
  const GradiantView({Key? key, required this.childView}) : super(key: key);
  final Widget childView;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.pinkAccent,
          ],
        ),
      ),
      child: childView,
    );
  }
}
