import 'package:server/index.dart';

final _logger = Logger();

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _getUser(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _getUser(RequestContext context) async {
  try {
    final request = UserRequest.fromJson(
      await context.request.json() as Json,
    );

    final isarService = context.read<IsarService>();

    final user = await isarService.getUserById(request.userId);

    if (user == null) {
      return Response.json(
        body: const UserResponse(result: UserResponseResult.userNotFound),
      );
    }

    return Response.json(
      body: UserResponse(
        result: UserResponseResult.success,
        user: user,
      ),
    );
  } catch (e, s) {
    _logger.e(UserResponseResult.requestIllegal, error: e, stackTrace: s);
    return Response.json(
      body: const UserResponse(result: UserResponseResult.requestIllegal),
    );
  }
}
