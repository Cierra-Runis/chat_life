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
    final double width = MediaQuery.of(context).size.width;
    final double side = width / 2.8;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: StatusBarWidget(
        dateTime: dateTime,
        backgroundColor: colorScheme.surface,
      ),
      body: Stack(
        children: [
          ChatLifeChat(save: save),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  thickness: 4,
                  indent: side,
                  endIndent: side,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
