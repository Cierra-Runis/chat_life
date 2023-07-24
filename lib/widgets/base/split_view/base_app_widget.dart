import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BaseAppWidget extends StatelessWidget {
  const BaseAppWidget({
    super.key,
    required this.navigatorKey,
    required this.colorScheme,
    required this.home,
    this.title = '',
    this.fontFamily = 'Torus',
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final ColorScheme colorScheme;
  final Widget home;
  final String title;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        fontFamily: fontFamily,
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: home,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const _PlatformScrollBehavior(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CN'),
      ],
    );
  }
}

class _PlatformScrollBehavior extends CupertinoScrollBehavior {
  const _PlatformScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices {
    return {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
      PointerDeviceKind.trackpad,
    };
  }
}
