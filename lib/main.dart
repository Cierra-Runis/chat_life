import 'package:chat_life/index.dart';

GlobalKey<NavigatorState> chatLifeAppGlobalKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> chatAppGlobalKey = GlobalKey<NavigatorState>();
IsarService isarService = IsarService();

void main() => ChatLife.run();

class ChatLifeApp extends StatelessWidget {
  const ChatLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime(2023, 01, 01, 19);

    return ChatLifeBaseAppWidget(
      navigatorKey: chatLifeAppGlobalKey,
      colorScheme:
          dateTime.isDay ? ChatLife.lightColorScheme : ChatLife.darkColorScheme,
      home: HomePage(
        save: Save(
          id: 0,
          createDateTime: DateTime.now(),
          latestEditTime: DateTime.now(),
        ),
        dateTime: dateTime,
      ),
    );
  }
}
