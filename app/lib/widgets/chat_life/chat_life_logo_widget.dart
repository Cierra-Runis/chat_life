import 'package:chat_life/index.dart';

class ChatLifeLogoWidget extends StatelessWidget {
  const ChatLifeLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/icon.svg',
              width: 96,
              colorFilter:
                  ColorFilter.mode(colorScheme.outline, BlendMode.srcIn),
            ),
            Text(
              ChatLife.appName,
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
