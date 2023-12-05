import 'package:chat_life/index.dart';

void main() => App.run();

final chatLifeAppKey = GlobalKey<NavigatorState>();

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
    );

    final darkTheme = ThemeData(
      fontFamily: App.fontTorus,
      fontFamilyFallback: const [App.fontCascadiaCodePL, App.fontMiSans],
      colorScheme: colorSchemes.dark,
      appBarTheme: appBarTheme,
    );

    Widget builder(context, child) => Column(
          children: [
            if (Platform.isWindows) const ChatLifeAppBar(),
            Expanded(child: ClipRRect(child: child)),
          ],
        );

    return MaterialApp(
      title: App.name,
      navigatorKey: chatLifeAppKey,
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: theme,
      darkTheme: darkTheme,
      themeMode: settings.themeMode,
      builder: builder,
      home: const BasedSplashPage(
        rootPage: _RootView(),
        appIcon: AppIcon(),
        appName: AppName(),
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

class AppName extends StatelessWidget {
  const AppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      App.name,
      style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
    );
  }
}

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/icon.svg',
      width: 96,
      colorFilter: ColorFilter.mode(
        context.colorScheme.outline,
        BlendMode.srcIn,
      ),
    );
  }
}

class _RootView extends ConsumerWidget {
  const _RootView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(localStoreProvider);

    return store.token == null || Token.verify(store.token!) == null
        ? const LoginPage()
        : const RootPage();
  }
}
