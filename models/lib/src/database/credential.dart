import 'package:models/index.dart';
part 'credential.g.dart';
part 'credential.freezed.dart';

/// {@template models.credential}
/// User's credential, contains private keys
///
/// For user's profile, please check [User]
/// {@endtemplate}
@freezed
@Collection(ignore: {'copyWith'})
class Credential with _$Credential {
  /// {@macro models.credential}
  const factory Credential({
    required String id,
    required String userId,
    @Index(unique: true) required String email,
    required String password,
    DateTime? emailVerifiedAt,
    @Default(Isar.autoIncrement) Id isarId,
  }) = _Credential;

  const Credential._();

  factory Credential.fromJson(Json json) => _$CredentialFromJson(json);

  @override
  Id get isarId => fastHash(id);
}
