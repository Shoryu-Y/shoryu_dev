import 'package:flutter/material.dart';

class CustomSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  const CustomSliderTrackShape();

  @override
  void paint(
    PaintingContext context,
    Offset? offset, {
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    Animation<double>? enableAnimation,
    Offset? thumbCenter,
    bool? isEnabled,
    bool? isDiscrete,
    TextDirection? textDirection,
  }) {
    final activeTrackColorTween = ColorTween(
      begin: sliderTheme?.disabledActiveTrackColor,
      end: sliderTheme?.activeTrackColor,
    );
    final inactiveTrackColorTween = ColorTween(
      begin: sliderTheme?.disabledInactiveTrackColor,
      end: sliderTheme?.inactiveTrackColor,
    );
    final activePaint = Paint()
      ..color = activeTrackColorTween.evaluate(enableAnimation!)!;
    final inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    late final Paint leftTrackPaint;
    late final Paint rightTrackPaint;

    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
      case null:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
    }

    final trackRect = getPreferredRect(
      parentBox: parentBox!,
      offset: offset!,
      sliderTheme: sliderTheme!,
      isEnabled: isEnabled!,
      isDiscrete: isDiscrete!,
    );

    final leftTrackSegment = Rect.fromLTRB(
      trackRect.left,
      trackRect.top,
      thumbCenter!.dx,
      trackRect.bottom,
    );
    if (!leftTrackSegment.isEmpty) {
      context.canvas.drawRect(leftTrackSegment, leftTrackPaint);
    }
    final rightTrackSegment = Rect.fromLTRB(
      thumbCenter.dx,
      trackRect.top,
      trackRect.right,
      trackRect.bottom,
    );
    if (!rightTrackSegment.isEmpty) {
      context.canvas.drawRect(rightTrackSegment, rightTrackPaint);
    }

    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    context.canvas.drawLine(
      Offset(trackRect.left, trackRect.center.dy + 20),
      Offset(trackRect.left, trackRect.center.dy - 20),
      paint,
    );
    context.canvas.drawLine(
      Offset(trackRect.right, trackRect.center.dy + 20),
      Offset(trackRect.right, trackRect.center.dy - 20),
      paint,
    );
  }
}
