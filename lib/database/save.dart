import 'package:chat_life/index.dart';

part 'save.g.dart';

@collection
class Save {
  const Save({
    required this.id,
    required this.createDateTime,
    required this.latestEditTime,
    required this.currentUserJsonString,
    required this.messagesJsonString,
  });

  final Id id;

  /// 创建时间
  final DateTime createDateTime;

  /// 最后编辑时间
  final DateTime latestEditTime;

  /// 现在视角
  final String currentUserJsonString;

  @ignore
  ChatUser get currentUser => ChatUser.fromJson(
        jsonDecode(currentUserJsonString),
      );

  /// 历史信息
  final String messagesJsonString;

  @ignore
  List<Message> get messages {
    final List list = jsonDecode(messagesJsonString);
    return list.map((i) => Message.fromJson(i)).toList();
  }
}
