import 'package:chat_life/index.dart';

void main() => App.run();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: App.name,
      theme: ThemeData(
        fontFamily: App.fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: App.fontFamily,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: BasedSplashPage(
        rootPage: Scaffold(
          appBar: Platform.isWindows ? const ChatLifeAppBar() : null,
          body: const RootView(),
        ),
        appIcon: const Placeholder(),
        appName: const Text(App.name),
      ),
    );
  }
}
