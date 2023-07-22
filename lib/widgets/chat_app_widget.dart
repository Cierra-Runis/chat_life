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
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/icon.svg',
                    width: 128,
                    colorFilter:
                        ColorFilter.mode(colorScheme.outline, BlendMode.srcIn),
                  ),
                  Text(
                    ChatLife.appName,
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
