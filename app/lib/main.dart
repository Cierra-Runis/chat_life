import 'package:chat_life/index.dart';

void main() => App.run();

late Color seedColor;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appBarTheme = AppBarTheme(
      centerTitle: true,
    );

    final theme = ThemeData(
      fontFamily: App.fontFamily,
      fontFamilyFallback: const [App.fontFamilyFallback],
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
      ),
      appBarTheme: appBarTheme,
      useMaterial3: true,
    );

    final darkTheme = ThemeData(
      fontFamily: App.fontFamily,
      fontFamilyFallback: const [App.fontFamilyFallback],
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: seedColor,
      ),
      appBarTheme: appBarTheme,
      useMaterial3: true,
    );

    return MaterialApp(
      title: App.name,
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: theme,
      darkTheme: darkTheme,
      home: BasedSplashPage(
        rootPage: Column(
          children: [
            if (Platform.isWindows) const ChatLifeAppBar(),
            const Expanded(child: RootPage()),
          ],
        ),
        appIcon: const Placeholder(),
        appName: const Text(App.name),
      ),
      supportedLocales: const [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
