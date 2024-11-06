import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr/ui/pages/text_recognition/model/dictionary_model.dart';
import 'package:ocr/constants/styles.dart';

class PhoneticWidget extends StatefulWidget {
  Phonetic phonetic;

  PhoneticWidget({super.key, required this.phonetic});

  @override
  State<PhoneticWidget> createState() => _PhoneticWidgetState();
}

class _PhoneticWidgetState extends State<PhoneticWidget> {
  var playing = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () => {
              setState(() {
                playing = true;
              })
            },
        child: Container(
          // color: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(0x44),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1.0)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${widget.phonetic.local}',
                style: textStyleBoldTag,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  '${widget.phonetic.text}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ),
              Image.asset(
                playing
                    ? 'assets/images/sound.png'
                    : 'assets/images/sound_1.png',
                width: 18,
                height: 18,
                fit: BoxFit.cover,
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
