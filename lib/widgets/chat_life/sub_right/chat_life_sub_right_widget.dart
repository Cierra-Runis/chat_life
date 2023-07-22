import 'package:chat_life/index.dart';

class ChatLifeSubRightWidget extends StatelessWidget {
  const ChatLifeSubRightWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      flex: 3,
      child: ClipRect(
        child: BaseAppWidget(
          navigatorKey: chatAppGlobalKey,
          colorScheme: colorScheme,
          home: const Scaffold(body: Center(child: ChatLifeLogoWidget())),
        ),
      ),
    );
  }
}
