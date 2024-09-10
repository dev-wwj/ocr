import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/route/route_utils.dart';
import 'package:ocr/route/routes.dart';
import 'package:oktoast/oktoast.dart';

void main() => runApp(AppDelegate());

class AppDelegate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppDelegateState();
}

class _AppDelegateState extends State<AppDelegate> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                  debugShowCheckedModeBanner: true,
                  title: 'MyApp',
                  theme: ThemeData(
                      primarySwatch: Colors.yellow,
                      textTheme: Typography.englishLike2018
                          .apply(fontSizeFactor: 1.sp),
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                      useMaterial3: true),
                  navigatorKey: RouteUtils.navigatorState,
                  onGenerateRoute: Routes.generateRoute,
                  initialRoute: Path.tab);
            }));
  }
}
