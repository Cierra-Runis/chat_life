import 'package:chat_life/index.dart';

class User {
  const User({
    required this.id,
    required this.icon,
    required this.name,
    required this.motto,
    required this.userRooms,
    required this.switchableUserIds,
  });

  final Id id;

  final String icon;

  final String name;

  final String motto;

  final List<UserRoom> userRooms;

  final List<Id> switchableUserIds;
}

class UserRoom {
  const UserRoom({
    required this.id,
    required this.dateTime,
  });
  final Id id;
  final DateTime dateTime;
}
