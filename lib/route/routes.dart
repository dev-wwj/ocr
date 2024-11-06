import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr/ui/pages/mine/settings_view.dart';
import 'package:ocr/ui/scanner.dart';
import 'package:ocr/ui/tab_view.dart';

class Path {

  static const String tab = '/';
  static const String settings = '/settings';

}

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Path.tab:
        return pageRoute(TabView(), settings: settings);
      case Path.settings:
        return pageRoute(SettingsView(), settings: settings);
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