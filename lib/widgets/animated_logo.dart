import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  final bool isExpanded;

  const AnimatedLogo({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1400),
      curve: Curves.easeInOutSine,
      width: isExpanded ? 350 : 300,
      height: isExpanded ? 350 : 300,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
