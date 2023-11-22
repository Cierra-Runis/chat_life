import 'package:models/index.dart';
part 'index.g.dart';
part 'index.freezed.dart';

@freezed
class UserRequest with _$UserRequest {
  const factory UserRequest({
    required String userId,
  }) = _UserRequest;

  const UserRequest._();

  factory UserRequest.fromJson(Json json) => _$UserRequestFromJson(json);
}

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required UserResponseResult result,
    User? user,
  }) = _UserResponse;

  const UserResponse._();

  factory UserResponse.fromJson(Json json) => _$UserResponseFromJson(json);
}

enum UserResponseResult { success, userNotFound, requestIllegal }
