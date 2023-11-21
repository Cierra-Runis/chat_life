import 'package:server/index.dart';

final isarService = _IsarService();

abstract class _IsarServiceImpl {
  late Future<Isar> _db;
}

class _IsarService extends _IsarServiceImpl
    with _CredentialService, _UserService {
  _IsarService() {
    _db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final isar = await Isar.open(
        [CredentialSchema, UserSchema],
        directory: Directory.systemTemp.path,
        compactOnLaunch: const CompactCondition(
          /// 压缩能减小 1KB 及以上，且达到了 1KB 的体积就进行压缩
          minBytes: 1024,
          minFileSize: 1024,
        ),
      );

      return isar;
    }
    return Future.value(Isar.getInstance());
  }
}

mixin _CredentialService on _IsarServiceImpl {
  Future<int> createCredential(Credential credential) async {
    final isar = await _db;
    return isar.writeTxn(() => isar.credentials.put(credential));
  }

  Future<bool> emailOccupied(String email) async {
    final isar = await _db;
    return isar.credentials.where().emailEqualTo(email).isNotEmpty();
  }
}

mixin _UserService on _IsarServiceImpl {
  Future<int> createUser(User user) async {
    final isar = await _db;
    return isar.writeTxn(() => isar.users.put(user));
  }

  Future<User?> getUserByIsarId(Id isarId) async {
    final isar = await _db;
    return isar.users.where().isarIdEqualTo(isarId).findFirst();
  }
}
