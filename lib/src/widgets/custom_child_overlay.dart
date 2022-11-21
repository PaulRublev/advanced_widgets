import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomChildOverlay extends SingleChildRenderObjectWidget {
  const CustomChildOverlay({super.key, super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _CustomRenderBox();
  }
}

class _CustomRenderBox extends RenderProxyBox {
  _CustomRenderBox({
    RenderBox? child,
  }) : super(child);

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      final Rect rectOuter = offset & size;
      context.paintChild(child!, offset);
      final Paint shadowPaint = Paint()
        ..blendMode = BlendMode.srcOver
        ..colorFilter = const ColorFilter.mode(Colors.grey, BlendMode.srcIn);

      context.canvas
        ..saveLayer(rectOuter, Paint())
        ..saveLayer(rectOuter, shadowPaint)
        ..translate(0.4, 0.4);
      context.paintChild(child!, offset);
    }
  }
}
