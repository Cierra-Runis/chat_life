import 'package:chat_life/index.dart';

class Save {
  const Save({
    required this.id,
    required this.createDateTime,
    required this.latestEditTime,
  });

  final Id id;

  /// 创建时间
  final DateTime createDateTime;

  /// 最后编辑时间
  final DateTime latestEditTime;
}
