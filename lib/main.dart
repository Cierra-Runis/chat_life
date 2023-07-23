import 'package:chat_life/index.dart';

GlobalKey<NavigatorState> iPadGlobalKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> chatLifeAppGlobalKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> chatLifeSubAppGlobalKey = GlobalKey<NavigatorState>();

IsarService isarService = IsarService();

void main() => ChatLife.run();

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime(2023, 01, 01, 19);

    return BaseAppWidget(
      navigatorKey: iPadGlobalKey,
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
