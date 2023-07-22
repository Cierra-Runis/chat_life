import 'package:chat_life/index.dart';

part 'room.g.dart';

@collection
class Room {
  const Room({
    required this.id,
    required this.type,
    required this.title,
    required this.icon,
    required this.userIds,
    required this.messages,
    required this.unreadMessages,
  });

  final Id id;

  @enumerated
  final RoomType type;

  final String title;

  final String icon;

  final List<Id> userIds;

  final List<String> messages;

  final List<String> unreadMessages;
}
