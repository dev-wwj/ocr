import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/constants/styles.dart';
import 'package:ocr/constants/word_parts.dart';
import 'package:ocr/ui/pages/text_recognition/model/dictionary_model.dart';

class MeaningWidget extends StatefulWidget {
  Meaning meaning;

  MeaningWidget({super.key, required this.meaning});

  @override
  State<StatefulWidget> createState() => _MeaningWidgetState();
}

class _MeaningWidgetState extends State<MeaningWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
            child: Text(
              WordPartEx.simple(widget.meaning.partOfSpeech),
              style: textStyleBoldTag,
            ),
          ),
          if (widget.meaning.definitions != null) ...[
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.meaning.definitions!.map((item) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.definition}',
                          ),
                          Text(
                              '${item.translatorModel?.translations?.first.text}')
                        ],
                      );
                    }).toList()))
          ]
        ],
      ),
    );
  }
}
