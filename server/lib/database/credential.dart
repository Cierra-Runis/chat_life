import 'package:server/index.dart';
part 'credential.g.dart';
part 'credential.freezed.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Credential with _$Credential {
  const factory Credential({
    required String id,
    required String userId,
    @Index(unique: true) required String email,
    required String password,
    @Default(Isar.autoIncrement) Id isarId,
  }) = _Credential;

  const Credential._();

  factory Credential.fromJson(Map<String, Object?> json) =>
      _$CredentialFromJson(json);

  @override
  Id get isarId => fastHash(id);
}
