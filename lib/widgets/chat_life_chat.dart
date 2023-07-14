import 'package:chat_life/index.dart';

class ChatLifeChat extends ConsumerWidget {
  const ChatLifeChat({
    super.key,
    required this.save,
  });

  final Save save;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Container(
          color: colorScheme.surface,
          padding: const EdgeInsets.all(16.0),
          child: Center(),
        ),
      ],
    );
  }
}
