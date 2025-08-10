import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphismWidget extends StatelessWidget {
  final double width;
  final double height;
  final double colorOpacity;
  final double borderOpacity;
  final double borderWidth;
  final double blur;
  final Widget child;

   const GlassmorphismWidget({
    super.key,
    required this.width,
    required this.height,
    required this.colorOpacity,
    required this.borderOpacity,
    required this.child,
    required this.borderWidth,
    required this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withValues(alpha: borderOpacity),
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(28),
            color: Colors.white.withValues(alpha: colorOpacity),
          ),
          child: child,
        ),
      ),
    );
  }
}
