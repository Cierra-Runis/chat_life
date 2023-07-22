import 'package:chat_life/index.dart';

part 'message.g.dart';

@collection
class Message {
  Message({
    required this.id,
    required this.userId,
    required this.sendDateTime,
    this.content = '',
  });

  final Id id;

  final int userId;

  final room = IsarLink<Room>();

  final DateTime sendDateTime;

  final String content;
}
