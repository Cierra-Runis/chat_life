import 'dart:convert';
import 'dart:math';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:logger/logger.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

final logger = Logger(
  printer: PrettyPrinter(
    printTime: true,
  ),
);

Handler get onRequest {
  return webSocketHandler((channel, protocol) {
    channel.stream.listen((message) {
      logger.i(message);
      if (message is String) {
        final input = types.TextMessage.fromJson(jsonDecode(message));

        final backMessage = types.TextMessage(
          author: const types.User(id: '114', firstName: '你好'),
          id: randomString(),
          text: '你说 ${input.text} 了你说',
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );

        channel.sink.add(jsonEncode(backMessage.toJson()));
      }
    });
  });
}
