import 'package:chat_life/index.dart';

class IsarService {
  late Future<Isar> _db;

  /// 创建一个 `IsarService`
  IsarService() {
    _db = openDB();
  }

  /// 清除数据库
  Future<void> cleanDb() async {
    final isar = await _db;
    await isar.writeTxn(isar.clear);
  }

  Future<Room?> getRoomById(Id roomId) async {
    final isar = await _db;
    return isar.rooms.filter().idEqualTo(roomId).findFirst();
  }

  /// 打开数据库
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      /// TIPS: 对 Windows 而言为 C:\Users\{user_name}\AppData\Roaming\pers.cierra_runis\chat_life'
      Directory dir = await getApplicationSupportDirectory();

      final isar = await Isar.open(
        [MessageSchema, RoomSchema],
        inspector: true,
        name: ChatLife.database,
        directory: dir.path,
        compactOnLaunch: const CompactCondition(
          /// 压缩能减小 1KB 及以上，且达到了 1KB 的体积就进行压缩
          minBytes: 1024,
          minFileSize: 1024,
        ),
      );
      return isar;
    }
    return Future.value(Isar.getInstance(ChatLife.database));
  }
}
