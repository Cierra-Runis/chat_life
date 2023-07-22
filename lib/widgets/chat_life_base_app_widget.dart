import 'package:chat_life/index.dart';

class ChatLifeBaseAppWidget extends StatelessWidget {
  const ChatLifeBaseAppWidget({
    super.key,
    required this.navigatorKey,
    required this.colorScheme,
    required this.home,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final ColorScheme colorScheme;
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ChatLife.appName,
      theme: ThemeData(
        fontFamily: 'Torus',
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
