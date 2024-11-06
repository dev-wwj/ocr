import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class SettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsViewState();

}

class _SettingsViewState extends State<SettingsView> {

  final GlobalKey<ExpansionTileCardState> cardLanguage = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置'),),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        Padding(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12), child: ExpansionTileCard(
          key: cardLanguage,
          title: const Text('选择语言'),
          // subtitle: const Text('en'),
          children: const [
            Text('cn'),
            Text('en'),
            Text('fr')
          ],
        ),)
      ],
    );
  }

}