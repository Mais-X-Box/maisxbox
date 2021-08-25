import 'package:flutter/material.dart';

class SizeAndPositionHelper {
  static Offset getElementPosition(GlobalKey? elementKey) {
    final RenderBox blockRender = elementKey?.currentContext?.findRenderObject() as RenderBox;
    final Offset position = blockRender.localToGlobal(Offset.zero);
    return position;
  }

  static Size getElementSize(GlobalKey? elementKey) {
    final RenderBox blockRender = elementKey?.currentContext?.findRenderObject() as RenderBox;
    final Size size = blockRender.size;
    return size;
  }
}
