import 'package:chat_life/index.dart';

GlobalKey<NavigatorState> rootAppGlobalKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> chatAppGlobalKey = GlobalKey<NavigatorState>();
IsarService isarService = IsarService();

void main() => ChatLife.run();

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime(2023, 01, 01, 19);

    return BaseAppWidget(
      navigatorKey: rootAppGlobalKey,
      colorScheme:
          dateTime.isDay ? ChatLife.lightColorScheme : ChatLife.darkColorScheme,
      home: IpadWidget(
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
