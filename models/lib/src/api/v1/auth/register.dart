import 'package:models/index.dart';
part 'register.g.dart';
part 'register.freezed.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String username,
    required String email,
    required String password,
  }) = _RegisterRequest;

  const RegisterRequest._();

  factory RegisterRequest.fromJson(Json json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required RegisterResponseResult result,
    String? token,
  }) = _RegisterResponse;

  const RegisterResponse._();

  factory RegisterResponse.fromJson(Json json) =>
      _$RegisterResponseFromJson(json);
}

enum RegisterResponseResult { success, emailOccupied, requestIllegal }
