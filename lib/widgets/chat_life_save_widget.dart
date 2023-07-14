import 'package:chat_life/index.dart';

class ChatLifeSaveWidget extends StatelessWidget {
  const ChatLifeSaveWidget({
    super.key,
    required this.save,
    required this.name,
    required this.dateTime,
    required this.deleteMode,
  });

  final Save save;
  final String name;
  final DateTime dateTime;
  final bool deleteMode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      dateTime: dateTime,
                    ),
                  ),
                );
              },
              onLongPress: () => isarService.deleteSaveById(save.id),
              child: SvgPicture.asset(
                'assets/images/icon.svg',
                width: 54,
                colorFilter: const ColorFilter.mode(
                  Colors.purple,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
