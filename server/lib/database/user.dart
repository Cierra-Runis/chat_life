import 'package:server/index.dart';
part 'user.g.dart';
part 'user.freezed.dart';

@freezed
@Collection(ignore: {'copyWith'})
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required DateTime createAt,
    @Default(Isar.autoIncrement) Id isarId,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  @override
  Id get isarId => fastHash(id);
}
