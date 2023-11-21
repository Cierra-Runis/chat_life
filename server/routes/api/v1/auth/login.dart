import 'package:server/index.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.post => _login(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _login(RequestContext context) async {
  try {
    final request = LoginRequest.fromJson(
      await context.request.json() as Map<String, dynamic>,
    );

    switch (request.method) {
      case LoginRequestMethod.email:
        {}
      case LoginRequestMethod.userId:
        {}
    }
  } catch (e) {
    return Response.json(body: const LoginResponse.error());
  }
}
