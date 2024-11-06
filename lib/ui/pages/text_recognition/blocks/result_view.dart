import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr/constants/colors.dart';
import 'package:ocr/ui/pages/text_recognition/components/meaning_widget.dart';
import 'package:ocr/ui/pages/text_recognition/components/phonetic_widget.dart';
import '../model/dictionary_model.dart';
import '../recognition_notifier.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class ResultView extends StatefulWidget {
  ResultView({super.key});

  @override
  State<StatefulWidget> createState() => ResultViewState();
}

class ResultViewState extends State<ResultView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecognitionNotifier>(builder: (_, notifier, child) {
      var phonetics = notifier.dictionaryModel?.phonetics;
      var meanings = notifier.dictionaryModel?.meanings;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: notifier.textEditingController,
            focusNode: notifier.focusNode,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                labelText: "scan fetch".tr,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () => notifier.entries(),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ))),
          ),
          if (phonetics != null) ...[
            const SizedBox(
              height: 15,
            ),
            Wrap(
                spacing: 10.0,
                runSpacing: 8.0,
                children:
                    phonetics.where((item) => item.verify).map((Phonetic item) {
                  return PhoneticWidget(phonetic: item);
                }).toList()),
          ],
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: primaryColor,
            height: 1,
          ),
          if (meanings != null) ...[
            const SizedBox(
              height: 10,
            ),
            Column(
              children: meanings.map((item) {
                return Padding(padding: const EdgeInsets.symmetric(vertical: 5),child: MeaningWidget(
                  meaning: item,
                ),);
              }).toList(),
            )
          ]
        ],
      );
    });
  }
}
