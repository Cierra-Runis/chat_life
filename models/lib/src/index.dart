export 'api/v1/index.dart';
export 'database/index.dart';
export 'event.dart';
export 'message.dart';
export 'token.dart';

/// This method is used to generate `isarId` for class
/// that stored in isar database
int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}

/// Rename `Map<String, dynamic>` to `Json`
typedef Json = Map<String, dynamic>;
