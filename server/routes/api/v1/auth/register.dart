import 'package:server/index.dart';

final _logger = Logger();

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.post => _register(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _register(RequestContext context) async {
  try {
    final request = RegisterRequest.fromJson(
      await context.request.json() as Json,
    );

    final isarService = context.read<IsarService>();

    if (await isarService.emailOccupied(request.email)) {
      return Response.json(
        body: const RegisterResponse(
          result: RegisterResponseResult.emailOccupied,
        ),
      );
    }

    final userId = const UuidV4().generate();

    await isarService.createUser(
      User(
        id: userId,
        name: request.username,
        createAt: DateTime.now(),
        updateAt: DateTime.now(),
      ),
    );

    final credential = Credential(
      id: const UuidV4().generate(),
      userId: userId,
      email: request.email,
      password: request.password,
    );

    await isarService.createCredential(credential);

    return Response.json(
      body: RegisterResponse(
        result: RegisterResponseResult.success,
        token: JWT(
          Token.fromCredential(credential).toJson(),
        ).sign(SecretKey('secret')),
      ),
    );
  } catch (e, s) {
    _logger.e(RegisterResponseResult.requestIllegal, error: e, stackTrace: s);
    return Response.json(
      body: const RegisterResponse(
        result: RegisterResponseResult.requestIllegal,
      ),
    );
  }
}
