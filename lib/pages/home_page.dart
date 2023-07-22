import 'package:chat_life/index.dart';
import 'package:chat_life/widgets/chat_life_chat.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.save,
    required this.dateTime,
  });

  final Save save;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: StatusBarWidget(
        dateTime: dateTime,
        backgroundColor: colorScheme.surface,
      ),
      body: Stack(
        children: [
          ChatLifeChat(save: save, dateTime: dateTime),
          const DockBarWidget()
        ],
      ),
    );
  }
}
