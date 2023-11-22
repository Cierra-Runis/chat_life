import 'package:models/index.dart';
part 'user.g.dart';
part 'user.freezed.dart';

/// User's profile, not contains private keys
///
/// For private keys like email, password, please
/// check [Credential]
@freezed
@Collection(ignore: {'copyWith'})
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required DateTime createAt,
    required DateTime updateAt,
    @Default(Isar.autoIncrement) Id isarId,
  }) = _User;

  const User._();

  factory User.fromJson(Json json) => _$UserFromJson(json);

  @override
  Id get isarId => fastHash(id);
}
