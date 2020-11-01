import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';
import '../models/constants/locale.dart';
import '../models/user_interface.dart';
import '../services/navigation_service.dart';
import '../services/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData _materialTheme = context.select((UserInterface ui) => ui.materialTheme);
    final CupertinoThemeData _cupertinoTheme = context.select((UserInterface ui) => ui.cupertinoTheme);
    final Locale _locale = Locale(context.select((UserInterface ui) => ui.locale));
    return UserInterface.isApple
        ? CupertinoApp(
            navigatorKey: locator<NavigationService>().navigatorKey,
            localizationsDelegates: localizationDelgates,
            supportedLocales: supportedLocales,
            locale: _locale,
            theme: _cupertinoTheme,
            onGenerateRoute: UiRouter.generateRoute,
            initialRoute: UiRouter.initialScreen)
        : MaterialApp(
            navigatorKey: locator<NavigationService>().navigatorKey,
            localizationsDelegates: localizationDelgates,
            supportedLocales: supportedLocales,
            locale: _locale,
            theme: _materialTheme,
            onGenerateRoute: UiRouter.generateRoute,
            initialRoute: UiRouter.initialScreen);
  }
}
