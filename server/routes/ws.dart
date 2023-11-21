import 'package:server/index.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

final _logger = Logger();

Handler get onRequest {
  return webSocketHandler((channel, protocol) {
    channel.stream.listen((message) {
      _logger.i(message);
      if (message is String) {
        final json = jsonDecode(message) as Map<String, dynamic>;
        final _ = switch (Message.fromJson(json)) {
          final TextMessage textMessage => _logger.i(textMessage),
          final ImageMessage imageMessage => _logger.i(imageMessage),
        };
      }
    });
  });
}
