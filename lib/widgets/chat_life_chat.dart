import 'package:chat_life/index.dart';

class ChatLifeChat extends StatelessWidget {
  const ChatLifeChat({
    super.key,
    required this.save,
    required this.dateTime,
  });

  final Save save;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ChatListWidget(
          user: User(
            id: 43967184365,
            icon: 'assets/images/chaos.jpg',
            name: 'chaos',
            switchableUserIds: [
              54284364881,
            ],
            roomIds: [],
          ),
        ),
        ChatAppWidget(),
      ],
    );
  }
}
