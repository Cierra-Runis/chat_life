export 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:isar/isar.dart';
export 'package:isar_flutter_libs/isar_flutter_libs.dart';

export 'src/index.dart';

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
