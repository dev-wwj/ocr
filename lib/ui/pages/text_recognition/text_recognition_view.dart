import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr/ui/pages/text_recognition/blocks/result_view.dart';
import 'package:ocr/ui/pages/text_recognition/blocks/vision_detecotr_views/detector_view.dart';
import 'package:ocr/ui/pages/text_recognition/blocks/vision_detecotr_views/painters/coordinates_translator.dart';
import 'package:ocr/ui/pages/text_recognition/blocks/vision_detecotr_views/painters/text_recognizer_single_painter.dart';
import 'package:ocr/ui/pages/text_recognition/blocks/vision_detecotr_views/scan_box.dart';
import 'package:ocr/ui/pages/text_recognition/recognition_notifier.dart';
import 'package:provider/provider.dart';

class TextRecognizerView extends StatefulWidget {
  const TextRecognizerView({super.key});

  @override
  State<StatefulWidget> createState() => _TextRecognizerViewState();
}

class _TextRecognizerViewState extends State<TextRecognizerView> {
  var _script = TextRecognitionScript.latin;
  var _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  var _cameraLensDirection = CameraLensDirection.back;

  final _scanBoxSize = const Size(100, 30);

  final _scanBoxKey = GlobalKey();

  final _detectorKey = GlobalKey();

  RecognitionNotifier notifier = RecognitionNotifier();

  @override
  void dispose() {
    // TODO: implement dispose
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => notifier,
      child: Scaffold(
          body: SafeArea(
              child: Stack(children: [
        DetectorView(
          key: _detectorKey,
          title: 'Text Detector',
          customPaint: _customPaint,
          text: notifier.text,
          onImage: _processImage,
          initialCameraLensDirection: _cameraLensDirection,
          onCameraLensDirectionChanged: (value) => _cameraLensDirection = value,
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildDropdown(),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
                height: 50,
                child: Align(
                    alignment: Alignment.center, // 垂直居中
                    child: ScanBox(
                      key: _scanBoxKey,
                      boxSize: _scanBoxSize,
                    )))),
        Positioned(
            left: 20.w,
            top: 110.h,
            right: 20.w,
            child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xAA000000),
                        Color(0x99000000),
                      ]),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ResultView(),
              ),
            ))
      ]))),
    );
  }

  Widget _buildDropdown() => DropdownButton<TextRecognitionScript>(
        value: _script,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (TextRecognitionScript? script) {
          if (script != null) {
            setState(() {
              _script = script;
              _textRecognizer.close();
              _textRecognizer = TextRecognizer(script: _script);
            });
          }
        },
        items: TextRecognitionScript.values
            .map<DropdownMenuItem<TextRecognitionScript>>((script) {
          return DropdownMenuItem<TextRecognitionScript>(
            value: script,
            child: Text(script.name),
          );
        }).toList(),
      );

  TextBlock? block;

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    final recognizedText = await _textRecognizer.processImage(inputImage);
    // var block = recognizedText.blocks.first;
    final RenderBox detectorBox =
        _detectorKey.currentContext?.findRenderObject() as RenderBox;

    final RenderBox scanBox =
        _scanBoxKey.currentContext?.findRenderObject() as RenderBox;
    // final rect = scanBox?.localToGlobal(Offset.zero);
    // TextBlock? block = recognizedText.blocks.firstWhere((element) =>
    //     element.boundingBox.contains(Offset(rect!.dx + _scanBoxSize.width / 2,
    //         rect!.dy + _scanBoxSize.height / 2)));
    Offset scanCenter = Offset.zero;
    final size = scanBox.size;
    Offset detectorOffset = detectorBox.localToGlobal(Offset.zero);
    Offset scanBoxOffset = scanBox.localToGlobal(Offset.zero);
    // final rect = Rect.fromPoints(position, position.translate(size.width, size.height));
    // 现在你可以使用 rect 变量了
    double x = scanBoxOffset.dx - detectorOffset.dx + size.width / 2;
    double transX = translateXToImg(
        x,
        detectorBox.size,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection);
    double y = scanBoxOffset.dy + size.height / 2;
    double transY = translateYToImg(
        y,
        detectorBox.size,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection);
    scanCenter = Offset(transX, transY);
    TextBlock? block;
    for (final e in recognizedText.blocks) {
      if (e.boundingBox.contains(scanCenter)) {
        block = e;
        break;
      }
    }
    if (block == null || block.text == this.block?.text) return;
    this.block = block;
    // print('');
    // print('scan-rect: ${scanCenter.toString()}');
    // print('block-text: ${block.text}');
    // print('block-rect: ${block.boundingBox.toString()}');

    TextLine? textLine;
    for (final l in block.lines) {
      if (l.boundingBox.contains(scanCenter)) {
        textLine = l;
      }
    }
    if (textLine == null) return;
    TextElement? textElement;
    for (final e in textLine.elements) {
      if (e.boundingBox.contains(scanCenter)) {
        textElement = e;
      }
    }
    if (textElement == null) return;
    notifier.setText(textElement.text);

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerSinglePainter(
          textElement,
          inputImage.metadata!.size,
          inputImage.metadata!.rotation,
          _cameraLensDirection);
      _customPaint = CustomPaint(
        painter: painter,
      );
    } else {
      _isBusy = false;
      if (mounted) {
        setState(() {});
      }
    }
  }
}
