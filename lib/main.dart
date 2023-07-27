import 'package:chat_life/index.dart';

GlobalKey<NavigatorState> ipadGlobalKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> chatLifeNavigatorKey = GlobalKey<NavigatorState>();

IsarService isarService = IsarService();

void main() => ChatLife.run();

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(
        const Duration(seconds: 1),
        (_) => DateTime.now(),
      ),
      builder: (context, snapshot) {
        return BaseAppWidget(
          navigatorKey: ipadGlobalKey,
          colorScheme: (snapshot.data ?? DateTime.now()).isDay
              ? ChatLife.lightColorScheme
              : ChatLife.darkColorScheme,
          home: IpadWidget(
            ipadStatus: IpadStatus(
              dateTime: snapshot.data ?? DateTime.now(),
              batteryStatus: const BasedBatteryStatus(
                value: 10,
              ),
            ),
            currentApp: const ChatLifeSplitViewWidget(),
          ),
        );
      },
    );
  }
}
