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
    return Row(
      children: [
        ChatListWidget(
          user: User(
            id: 43967184365,
            icon: 'assets/images/chaos.jpg',
            name: 'chaos',
            motto: '存在。存在？',
            switchableUserIds: [
              54284364881,
            ],
            userRooms: [
              UserRoom(id: 0, dateTime: DateTime(2023, 01, 01, 18, 24)),
              UserRoom(id: 1, dateTime: DateTime(2023, 01, 01, 18, 29)),
            ],
          ),
        ),
        const ChatAppWidget(),
      ],
    );
  }
}
