import 'package:chat_life/index.dart';

void main() => App.run();

class ChatLifeApp extends ConsumerWidget {
  const ChatLifeApp({super.key});

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
      home: const BasedSplashPage(
        rootPage: _RootView(),
        appIcon: Placeholder(),
        appName: Text(App.name),
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

class _RootView extends ConsumerWidget {
  const _RootView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storeProvider);

    return Column(
      children: [
        if (Platform.isWindows) const ChatLifeAppBar(),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: store.token == null || Token.verify(store.token!) == null
                ? const LoginPage(
                    key: ValueKey(LoginPage),
                  )
                : const RootPage(
                    key: ValueKey(RootPage),
                  ),
          ),
        ),
      ],
    );
  }
}
