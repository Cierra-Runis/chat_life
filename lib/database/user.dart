import 'package:chat_life/index.dart';

part 'user.g.dart';

@collection
class User {
  const User({
    required this.id,
    required this.icon,
    required this.name,
    required this.roomIds,
    required this.switchableUserIds,
  });

  final Id id;

  final String icon;

  final String name;

  final List<Id> roomIds;

  final List<Id> switchableUserIds;
}
