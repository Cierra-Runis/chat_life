import 'package:models/index.dart';
part 'token.g.dart';
part 'token.freezed.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required String userId,
    required String email,
  }) = _Token;

  const Token._();

  /// Convert a [Json] to [Token]
  factory Token.fromJson(Json json) => _$TokenFromJson(json);

  /// Convert a [Credential] to [Token]
  factory Token.fromCredential(Credential credential) =>
      Token(userId: credential.userId, email: credential.email);

  static Token? verify(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey('secret'));
      return Token.fromJson(jwt.payload as Json);
    } catch (e) {
      return null;
    }
  }
}
