import 'package:chat_life/index.dart';

part 'room.g.dart';

@collection
class Room {
  Room({
    required this.id,
    required this.type,
    required this.title,
    required this.icon,
    required this.userIds,
  });

  final Id id;

  @enumerated
  final RoomType type;

  final String title;

  final String icon;

  final List<Id> userIds;

  @Backlink(to: 'room')
  final messages = IsarLinks<Message>();
}
