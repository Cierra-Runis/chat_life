import 'package:chat_life/index.dart';

class IpadWidget extends StatelessWidget {
  const IpadWidget({
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
      appBar: IpadStatusBarWidget(
        dateTime: dateTime,
        backgroundColor: colorScheme.surface,
      ),
      body: Stack(
        children: [
          ChatLifeAppWidget(save: save, dateTime: dateTime),
          const IpadDockBarWidget()
        ],
      ),
    );
  }
}
