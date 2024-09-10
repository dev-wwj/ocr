import 'package:flutter/cupertino.dart';

class ResultView extends StatefulWidget {

  String text;

  ResultView({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => ResultViewState();

}

class ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.text),
      ],
    );
  }

}