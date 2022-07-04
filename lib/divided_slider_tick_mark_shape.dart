import 'package:flutter/material.dart';

class DividedSliderTickMarkShape extends SliderTickMarkShape {
  @override
  Size getPreferredSize({
    SliderThemeData? sliderTheme,
    bool? isEnabled,
  }) {
    return const Size(10, 20);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    Animation<double>? enableAnimation,
    Offset? thumbCenter,
    bool? isEnabled,
    TextDirection? textDirection,
  }) {
    const height = 20;
    final paint = Paint()
      ..color = sliderTheme!.activeTrackColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    context.canvas.drawLine(
      Offset(center.dx, center.dy + height),
      Offset(center.dx, center.dy - height),
      paint,
    );
  }
}
