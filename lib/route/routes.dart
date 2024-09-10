import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr/scanner.dart';
import 'package:ocr/tab_view.dart';

class Path {

  static const String tab = '/';

}

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Path.tab:
        return pageRoute(TabView(), settings: settings);
    }

    return pageRoute(Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            '路由: ${settings.name} 不存在'
          ),
        ),
      ),
    ), settings: settings);
  }

  static MaterialPageRoute pageRoute(Widget page, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
    bool maintainState = true,
    bool allowSnapshotting = false
  }) {
    return MaterialPageRoute(builder: (context) {
      return page;
    },
    settings: settings,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
    allowSnapshotting: allowSnapshotting);
  }

}