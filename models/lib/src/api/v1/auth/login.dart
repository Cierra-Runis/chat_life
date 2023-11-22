import 'package:models/index.dart';
part 'login.g.dart';
part 'login.freezed.dart';

@Freezed(unionKey: 'method')
sealed class LoginRequest with _$LoginRequest {
  const factory LoginRequest.email({
    @Default(LoginRequestMethod.email) LoginRequestMethod method,
    required String email,
    required String password,
  }) = EmailLoginRequest;

  const factory LoginRequest.userId({
    @Default(LoginRequestMethod.userId) LoginRequestMethod method,
    required String userId,
    required String password,
  }) = UserIdLoginRequest;

  const LoginRequest._();

  factory LoginRequest.fromJson(Json json) => _$LoginRequestFromJson(json);
}

enum LoginRequestMethod { email, userId }

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required LoginResponseResult result,
    String? token,
  }) = _LoginResponse;

  const LoginResponse._();

  factory LoginResponse.fromJson(Json json) => _$LoginResponseFromJson(json);
}

enum LoginResponseResult {
  success,
  emailNotFound,
  userIdNotFound,
  passwordError,
  requestIllegal
}
