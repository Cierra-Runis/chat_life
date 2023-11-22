import 'package:server/index.dart';

Handler middleware(Handler handler) {
  return handler.use(
    bearerAuthentication<Token>(
      authenticator: (context, token) async => Token.verify(token),
    ),
  );
}
