import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'coordinates_translator.dart';

class TextRecognizerCenterPainter extends CustomPainter {
  TextRecognizerCenterPainter(
      this.offset, this.imageSize, this.rotation, this.cameraLensDirection);

  final Offset offset;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.lightGreenAccent;

    final Paint background = Paint()..color = const Color(0x99000000);
    final x =
        translateX(offset.dx, size, imageSize, rotation, cameraLensDirection);
    final y =
        translateY(offset.dy, size, imageSize, rotation, cameraLensDirection);
    canvas.drawRect(Rect.fromLTWH(x, y, 100, 100), paint);
  }

  @override
  bool shouldRepaint(TextRecognizerCenterPainter oldDelegate) {
    return oldDelegate.offset != offset;
  }
}

class TextRecognizerCenter extends StatefulWidget {
  TextRecognizerCenter(
      {super.key, required this.offset,
      required this.imageSize,
      required this.rotation,
      required this.cameraLensDirection});

  @override
  State<TextRecognizerCenter> createState() => _TextRecognizerCenterState();

  Offset offset;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;
}

class _TextRecognizerCenterState extends State<TextRecognizerCenter> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomPaint(
      painter: TextRecognizerCenterPainter(widget.offset, widget.imageSize,
          widget.rotation, widget.cameraLensDirection),
    ));
  }
}
