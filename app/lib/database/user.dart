import 'package:chat_life/index.dart';

class User {
  const User({
    required this.id,
    required this.icon,
    required this.name,
    required this.motto,
    required this.cover,
    required this.likes,
    required this.status,
    required this.userRoomIds,
    required this.contactUsers,
    required this.switchableUserIds,
  });

  final Id id;

  final String icon;

  final String name;

  final String motto;

  final String cover;

  final int likes;

  final UserStatusType status;

  final List<Id> userRoomIds;

  final List<User> contactUsers;

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
