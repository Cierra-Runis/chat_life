import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message.g.dart';

@riverpod
Message messageProvider(MessageProviderRef ref) {
  return const TextMessage(
    author: User(id: 'id'),
    id: '',
    text: 'aaa',
  );
}
