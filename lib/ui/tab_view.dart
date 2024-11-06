import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr/ui/pages/home/home_view.dart';
import 'package:ocr/ui/pages/mine/mine_view.dart';
import 'package:ocr/ui/pages/text_recognition/text_recognition_view.dart';
import 'package:get/get.dart';

class TabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: _pages,),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: _barItem,
        onTap: (index){
          currentIndex = index;
          setState(() {
          });
        },
      ) ,
    );
  }

  final List<BottomNavigationBarItem> _barItem =  [
    BottomNavigationBarItem(icon: const Icon(Icons.collections), label: 'home'.tr),
    const BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_outlined), label: '扫描'),
    const BottomNavigationBarItem(icon: Icon(Icons.collections), label: '收藏'),
  ];

  final List<Widget> _pages = [
    HomeView(),
    TextRecognizerView(key: GlobalKey(),),
    MineView(),
  ];

}