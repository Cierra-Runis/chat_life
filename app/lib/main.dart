import 'package:chat_life/index.dart';

void main() => App.run();

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchemes = ref.watch(colorSchemesProvider);
    final settings = ref.watch(settingsProvider);

    const appBarTheme = AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    );

    final theme = ThemeData(
      fontFamily: App.fontTorus,
      fontFamilyFallback: const [App.fontCascadiaCodePL, App.fontMiSans],
      colorScheme: colorSchemes.light,
      appBarTheme: appBarTheme,
      useMaterial3: true,
    );

    final darkTheme = ThemeData(
      fontFamily: App.fontTorus,
      fontFamilyFallback: const [App.fontCascadiaCodePL, App.fontMiSans],
      colorScheme: colorSchemes.dark,
      appBarTheme: appBarTheme,
      useMaterial3: true,
    );

    return MaterialApp(
      title: App.name,
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: theme,
      darkTheme: darkTheme,
      themeMode: settings.themeMode,
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
