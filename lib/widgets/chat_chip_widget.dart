import 'package:chat_life/index.dart';

class ChatChipWidget extends StatelessWidget {
  const ChatChipWidget({
    super.key,
    required this.iconData,
    required this.label,
    this.onPressed,
  });

  final IconData iconData;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return RawChip(
      avatar: Icon(iconData, color: colorScheme.outline),
      side: BorderSide.none,
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
