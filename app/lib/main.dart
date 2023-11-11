import 'package:chat_life/index.dart';

GlobalKey<NavigatorState> splitViewKey = GlobalKey<NavigatorState>();

IsarService isarService = IsarService();

void main() => ChatLife.run();

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      darkTheme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const ChatLifeSplitViewWidget(),
    );
  }
}
