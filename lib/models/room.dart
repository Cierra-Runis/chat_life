import 'package:chat_life/index.dart';

class Room {
  const Room({
    required this.type,
    required this.title,
    required this.icon,
    required this.users,
    required this.messages,
    required this.unreadMessages,
  });

  final RoomType type;
  final String title;
  final String icon;
  final List<User> users;
  final List<String> messages;
  final List<String> unreadMessages;
}
