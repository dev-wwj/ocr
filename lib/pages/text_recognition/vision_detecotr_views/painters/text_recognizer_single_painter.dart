import 'dart:io';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr/pages/text_recognition/vision_detecotr_views/painters/coordinates_translator.dart';

class TextRecognizerSinglePainter extends CustomPainter {
  TextRecognizerSinglePainter(this.textElement, this.imageSize, this.rotation,
      this.cameraLensDirection);

  final TextElement textElement;
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
    final ParagraphBuilder builder = ParagraphBuilder(
      ParagraphStyle(
          textAlign: TextAlign.left,
          fontSize: 16,
          textDirection: TextDirection.ltr),
    );
    builder.pushStyle(
        ui.TextStyle(color: Colors.lightGreenAccent, background: background));
    builder.addText(textElement.text);
    builder.pop();

    final left = translateX(textElement.boundingBox.left, size, imageSize,
        rotation, cameraLensDirection);
    final top = translateY(textElement.boundingBox.top, size, imageSize,
        rotation, cameraLensDirection);
    final right = translateX(
      textElement.boundingBox.right,
      size,
      imageSize,
      rotation,
      cameraLensDirection,
    );
    final List<Offset> cornerPoints = <Offset>[];
    for (final point in textElement.cornerPoints) {
      double x = translateX(
          point.x.toDouble(), size, imageSize, rotation, cameraLensDirection);
      double y = translateY(
          point.y.toDouble(), size, imageSize, rotation, cameraLensDirection);
      if (Platform.isAndroid) {
        switch (cameraLensDirection) {
          case CameraLensDirection.front:
            switch (rotation) {
              case InputImageRotation.rotation0deg:
              case InputImageRotation.rotation90deg:
                break;
              case InputImageRotation.rotation180deg:
                x = size.width - x;
                y = size.height - y;
                break;
              case InputImageRotation.rotation270deg:
                x = translateX(point.y.toDouble(), size, imageSize, rotation,
                    cameraLensDirection);
                y = size.height -
                    translateY(point.x.toDouble(), size, imageSize, rotation,
                        cameraLensDirection);
                break;
            }
            break;
          case CameraLensDirection.back:
            switch (rotation) {
              case InputImageRotation.rotation0deg:
              case InputImageRotation.rotation270deg:
                break;
              case InputImageRotation.rotation180deg:
                x = size.width - x;
                y = size.height - y;
                break;
              case InputImageRotation.rotation90deg:
                x = size.width -
                    translateX(
                      point.y.toDouble(),
                      size,
                      imageSize,
                      rotation,
                      cameraLensDirection,
                    );
                y = translateY(
                  point.x.toDouble(),
                  size,
                  imageSize,
                  rotation,
                  cameraLensDirection,
                );
                break;
            }
            break;
          case CameraLensDirection.external:
            break;
        }
      }
      cornerPoints.add(Offset(x, y));
    }
    cornerPoints.add(cornerPoints.first);
    canvas.drawPoints(PointMode.polygon, cornerPoints, paint);
    canvas.drawParagraph(
      builder.build()
        ..layout(ParagraphConstraints(width: (right - left).abs())),
      Offset(
          Platform.isAndroid &&
              cameraLensDirection == CameraLensDirection.front
              ? right
              : left,
          top),
    );
  }

  @override
  bool shouldRepaint(TextRecognizerSinglePainter oldDelegate) {
    return oldDelegate.textElement != textElement;
  }
}
