import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteUtils {

  RouteUtils._();

  static final navigatorState = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorState.currentContext!;

  static NavigatorState get state => navigatorState.currentState!;


  static Future push( BuildContext context,
      Widget page, {
        bool? fullscreenDialog,
        RouteSettings? settings,
        bool maintainState = true,
      }) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => page,
            fullscreenDialog: fullscreenDialog ?? false,
            settings: settings,
            maintainState: maintainState));
  }

  // 根据路由路径跳转
  static Future pushForName(
      BuildContext context,
      String name, {
        Object? arguments,
      }) {
    return Navigator.pushNamed(context, name, arguments: arguments);
  }

  //自定义route动态跳转
  static Future pushForPageRoute(BuildContext context, Route route) {
    return Navigator.push(context, route);
  }

  //清空栈,只留目标页面
  static Future pushNamedAndRemoveUntil(BuildContext context, String name,
      {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(context, name, (route) => false,
        arguments: arguments);
  }

  static Future pushAndRemoveUntil(
      BuildContext context, Route route) {
    return Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  //用新的路由替换当前路由
  static Future pushReplacement(BuildContext context, Route route,
      {Object? result}) {
    return Navigator.pushReplacement(context, route, result: result);
  }

  static Future pushReplacementName(BuildContext context, String name,
      {Object? result, Object? arguments}) {
    return Navigator.pushReplacementNamed(context, name,
        result: result, arguments: arguments);
  }

  static void pop(BuildContext context) {
    return Navigator.pop(context);
  }

  static void popUntil(BuildContext context, RoutePredicate predicate) {
    return Navigator.popUntil(
      context,
          (route) => false,
    );
  }

  static void removeRoute(BuildContext context, Route<dynamic> route) {
    return Navigator.removeRoute(context, route);
  }

  static void removeRouteBelow(
      BuildContext context, Route<dynamic> anchorRoute) {
    return Navigator.removeRouteBelow(context, anchorRoute);
  }

}