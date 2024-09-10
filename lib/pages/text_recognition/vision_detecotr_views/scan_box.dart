import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanBox extends StatelessWidget {

  ScanBox({super.key, required this.boxSize});

  final Size boxSize;

  @override
  Widget build(BuildContext context)  {
    return SizedBox(
      width: boxSize.width,
      height: boxSize.height,
      child: CustomPaint(
        painter: ScanBoxPainter() ,
      ),
    );
  }
}

class ScanBoxPainter extends CustomPainter {

  final double spa = 12;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..color = Colors.black54
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
    canvas.drawPath(Path()
        ..moveTo(0, spa)
        ..lineTo(0, 0)
        ..lineTo(spa, 0)
        ..moveTo(size.width - spa, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, spa)
        ..moveTo(size.width, size.height - spa)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width - spa, size.height)
        ..moveTo(spa, size.height)
        ..lineTo(0, size.height)
        ..lineTo(0, size.height -spa)
        , paint);
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
