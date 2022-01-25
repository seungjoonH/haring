import 'package:flutter/material.dart';
import 'package:haring4/models/dot.dart';

class MyPainter extends CustomPainter {

  final List<List<Dot>> lines;

  MyPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    for (var line in lines) {
      List<Offset> offsets = [];
      Path path = Path();
      Color? color;
      double? size;

      for (var dot in line) {
        color = dot.color;
        size = dot.size;
        offsets.add(dot.offset);
      }

      path.addPolygon(offsets, false);
      canvas.drawPath(path, Paint()
          ..color = color!
          ..strokeWidth = size!
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}