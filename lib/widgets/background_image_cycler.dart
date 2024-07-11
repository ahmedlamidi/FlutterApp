import 'package:flutter/material.dart';

class BackgroundImageCycler extends StatelessWidget {
  final int currentImageIndex;
  final List<String> images;

  const BackgroundImageCycler({
    super.key,
    required this.currentImageIndex,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Container(
        key: ValueKey<int>(currentImageIndex),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(images[currentImageIndex]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
