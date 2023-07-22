import 'package:chat_life/index.dart';

class ChatAppWidget extends StatelessWidget {
  const ChatAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      flex: 3,
      child: ClipRect(
        child: ChatLifeBaseAppWidget(
          navigatorKey: chatAppGlobalKey,
          colorScheme: colorScheme,
          home: const Scaffold(body: Center(child: ChatLifeLogoWidget())),
        ),
      ),
    );
  }
}
