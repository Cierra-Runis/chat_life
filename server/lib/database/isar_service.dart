import 'package:server/index.dart';

abstract class _IsarServiceImpl {
  late Future<Isar> _db;
}

class IsarService extends _IsarServiceImpl
    with _CredentialService, _UserService {
  IsarService() {
    _db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final isar = await Isar.open(
        [CredentialSchema, UserSchema],
        directory: Directory.systemTemp.path,
        compactOnLaunch: const CompactCondition(
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

  Future<(LoginResponseResult, Credential?)> canLoginWithEmail(
    EmailLoginRequest request,
  ) async {
    final isar = await _db;
    final credential =
        await isar.credentials.filter().emailEqualTo(request.email).findFirst();
    if (credential == null) return (LoginResponseResult.emailNotFound, null);
    if (credential.password != request.password) {
      return (LoginResponseResult.passwordError, null);
    }
    return (LoginResponseResult.success, credential);
  }

  Future<(LoginResponseResult, Credential?)> canLoginWithUserId(
    UserIdLoginRequest request,
  ) async {
    final isar = await _db;
    final credential = await isar.credentials
        .filter()
        .userIdEqualTo(request.userId)
        .findFirst();
    if (credential == null) return (LoginResponseResult.userIdNotFound, null);
    if (credential.password != request.password) {
      return (LoginResponseResult.passwordError, null);
    }
    return (LoginResponseResult.success, credential);
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

  Future<User?> getUserById(String id) async {
    final isar = await _db;
    return isar.users.filter().idEqualTo(id).findFirst();
  }

  Future<User?> getUserByIsarId(Id isarId) async {
    final isar = await _db;
    return isar.users.where().isarIdEqualTo(isarId).findFirst();
  }
}
