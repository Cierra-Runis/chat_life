import 'package:chat_life/index.dart';

part 'save.g.dart';

@collection
class Save {
  const Save({
    required this.id,
    required this.createDateTime,
    required this.latestEditTime,
    required this.messagesJsonString,
  });

  final Id id;

  /// 创建时间
  final DateTime createDateTime;

  /// 最后编辑时间
  final DateTime latestEditTime;

  /// 历史信息
  final String messagesJsonString;
}
