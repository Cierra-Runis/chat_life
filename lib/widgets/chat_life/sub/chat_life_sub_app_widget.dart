import 'package:chat_life/index.dart';

class ChatLifeSubAppWidget extends StatelessWidget {
  const ChatLifeSubAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      flex: 3,
      child: ClipRect(
        child: BaseAppWidget(
          navigatorKey: chatLifeSubAppGlobalKey,
          colorScheme: colorScheme,
          home: const Scaffold(body: Center(child: ChatLifeLogoWidget())),
        ),
      ),
    );
  }
}
