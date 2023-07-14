import 'package:chat_life/index.dart';

class IsarService {
  late Future<Isar> _db;

  /// 创建一个 `IsarService`
  IsarService() {
    _db = openDB();
  }

  Future<int> saveSave(Save newSave) async {
    final isar = await _db;
    return isar.writeTxn(() => isar.saves.put(newSave));
  }

  Stream<List<Save>> listenToSaves({
    int delayed = 1000,
  }) async* {
    final isar = await _db;
    await Future.delayed(Duration(milliseconds: delayed));
    yield* isar.saves
        .where()
        .sortByCreateDateTimeDesc()
        .watch(fireImmediately: true);
  }

  Future<void> deleteSaveById(int id) async {
    final isar = await _db;
    await isar.writeTxn(() => isar.saves.delete(id));
  }

  /// 清除数据库
  Future<void> cleanDb() async {
    final isar = await _db;
    await isar.writeTxn(() => isar.clear());
  }

  /// 打开数据库
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      /// TIPS: 对 Windows 而言为 C:\Users\{user_name}\Documents/ChatLife/
      Directory dir = await getApplicationSupportDirectory();

      ChatLife.printLog(dir);

      final isar = await Isar.open(
        [SaveSchema],
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
