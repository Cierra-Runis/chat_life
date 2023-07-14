import 'package:chat_life/index.dart';

IsarService isarService = IsarService();

void main() => ChatLife.run();

class ChatLifeApp extends StatelessWidget {
  const ChatLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime(2023, 1, 1, 19, 0);

    return MaterialApp(
      title: ChatLife.appName,
      theme: ThemeData(
        fontFamily: 'Torus',
        colorScheme: dateTime.isDay
            ? ChatLife.lightColorScheme
            : ChatLife.darkColorScheme,
        useMaterial3: true,
      ),
      scrollBehavior: const _PlatformScrollBehavior(),
      home: DesktopPage(dateTime: dateTime),
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
