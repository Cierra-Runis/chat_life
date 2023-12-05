import 'package:chat_life/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'event.g.dart';

@riverpod
WebSocketChannel event(
  EventRef ref,
  Uri uri, {
  Iterable<String>? protocols,
}) {
  return WebSocketChannel.connect(uri, protocols: protocols);
}

@riverpod
Stream<MessageEvent> messageEvent(
  MessageEventRef ref,
  Uri uri, {
  Iterable<String>? protocols,
}) {
  final channel = ref.watch(eventProvider(uri, protocols: protocols));
  return channel.stream
      .where((event) => event is MessageEvent)
      .cast<MessageEvent>();
  // return Stream.periodic(
  //   const Duration(seconds: 1),
  //   (index) => const MessageEvent(
  //     message: Message.text(
  //       id: 'id',
  //       data: [
  //         {TextMessageDataType.plain: '你好👋'},
  //       ],
  //     ),
  //   ),
  // );
}
