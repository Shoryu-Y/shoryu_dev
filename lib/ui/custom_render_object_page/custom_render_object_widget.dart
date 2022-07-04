import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRenderObjectWidget extends SingleChildRenderObjectWidget {
  const CustomRenderObjectWidget({super.key});

  @override
  MyRenderObject createRenderObject(BuildContext context) {
    return MyRenderObject();
  }

  @override
  void updateRenderObject(BuildContext context, MyRenderObject renderObject) {
    super.updateRenderObject(context, renderObject);
  }
}

class MyRenderObject extends RenderProxyBox {
  @override
  bool get sizedByParent => true;

  @override
  void performResize() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final c = context.canvas;

    // offsetのdx, dyにはスクリーン内の描画開始エリア情報 (オフセット) が入っています
    final dx = offset.dx;
    final dy = offset.dy;

    final p = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 255, 0, 0);

    var r = Rect.fromLTWH(dx + 10.0, dy + 10.0, 100, 100);
    c.drawRect(r, p);

    p
      ..style = PaintingStyle.stroke // 図形内部を塗り潰さない
      ..color = const Color.fromARGB(255, 0, 255, 0)
      ..strokeWidth = 10.0; // 線の太さ
    r = Rect.fromLTWH(dx + 150.0, dy + 110.0, 100, 100);
    c.drawRect(r, p);

    // 丸を描画する場合も四角とほぼ同じ感じです
    p
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 0, 0, 255);
    final ctr = Offset(dx + 350.0, dy + 260.0);
    c.drawCircle(ctr, 50, p);
  }
}
