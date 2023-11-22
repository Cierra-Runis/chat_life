import 'package:server/index.dart';

final _logger = Logger();

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.post => _login(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _login(RequestContext context) async {
  try {
    final request = LoginRequest.fromJson(
      await context.request.json() as Json,
    );

    final isarService = context.read<IsarService>();

    final (result, credential) = switch (request) {
      final EmailLoginRequest request =>
        await isarService.canLoginWithEmail(request),
      final UserIdLoginRequest request =>
        await isarService.canLoginWithUserId(request)
    };

    if (result != LoginResponseResult.success) {
      return Response.json(body: LoginResponse(result: result));
    }

    return Response.json(
      body: LoginResponse(
        result: result,
        token: JWT(
          Token.fromCredential(credential!).toJson(),
        ).sign(SecretKey('secret')),
      ),
    );
  } catch (e, s) {
    _logger.e(LoginResponseResult.requestIllegal, error: e, stackTrace: s);
    return Response.json(
      body: const LoginResponse(
        result: LoginResponseResult.requestIllegal,
      ),
    );
  }
}
