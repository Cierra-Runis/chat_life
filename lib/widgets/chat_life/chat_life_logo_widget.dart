import 'package:chat_life/index.dart';

class ChatLifeLogoWidget extends StatelessWidget {
  const ChatLifeLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/icon.svg',
          width: 128,
          colorFilter: ColorFilter.mode(colorScheme.outline, BlendMode.srcIn),
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
    );
  }
}
