import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr/route/route_utils.dart';
import 'package:ocr/route/routes.dart';

class MineView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {RouteUtils.pushForName(context, Path.settings)},
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const Text('body'),
    );
  }
}
