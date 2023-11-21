import 'package:models/index.dart';
part 'login.g.dart';
part 'login.freezed.dart';

@Freezed(unionKey: 'method')
sealed class LoginRequest with _$LoginRequest {
  const factory LoginRequest.email({
    @Default(LoginRequestMethod.email) LoginRequestMethod method,
    required String email,
    required String password,
  }) = _EmailLoginRequest;

  const factory LoginRequest.userId({
    @Default(LoginRequestMethod.userId) LoginRequestMethod method,
    required int userId,
    required String password,
  }) = _UserIdLoginRequest;

  const LoginRequest._();

  factory LoginRequest.fromJson(Map<String, Object?> json) =>
      _$LoginRequestFromJson(json);
}

enum LoginRequestMethod { email, userId }

class LoginResponse with _$LoginResponse {
  const factory LoginResponse.error({
    @Default(LoginResponseResult.requestIllegal) LoginResponseResult result,
    required String? token,
  }) = _ErrorLoginResponse;

  const factory LoginResponse.email({
    required LoginResponseResult result,
    required String? token,
  }) = _EmailLoginResponse;

  const factory LoginResponse.userId({
    required LoginResponseResult result,
    required String? token,
  }) = _UserIdLoginResponse;

  const LoginResponse._();

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}

enum LoginResponseResult {
  success,
  emailNotFound,
  userIdNotFound,
  passwordError,
  requestIllegal
}
