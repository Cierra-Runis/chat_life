import 'package:models/index.dart';
part 'message.g.dart';
part 'message.freezed.dart';

/// [MessageType] for identify [Message]
enum MessageType {
  /// [TextMessage]
  text,

  /// [ImageMessage]
  image
}

/// [Message]
@Freezed(unionKey: 'type')
sealed class Message with _$Message {
  const Message._();

  /// [TextMessage] contains a list of [MessageData]
  const factory Message.text({
    required String id,
    required List<MessageData> data,
    @Default(MessageType.text) MessageType type,
  }) = TextMessage;

  /// [ImageMessage] contains a list of [ImageMessageData]
  const factory Message.image({
    required String id,
    required List<ImageMessageData> data,
    @Default(MessageType.image) MessageType type,
  }) = ImageMessage;

  factory Message.fromJson(Json json) => _$MessageFromJson(json);
}

/// [MessageDataType] for identify [MessageData]
enum MessageDataType {
  /// [PlainMessageData]
  plain,

  /// [ImageMessageData]
  image,

  /// [UrlMessageData]
  url,
}

/// [MessageData]
@Freezed(unionKey: 'type')
sealed class MessageData with _$MessageData {
  const MessageData._();

  const factory MessageData.plain({
    required String text,
    @Default(MessageDataType.plain) MessageDataType type,
  }) = PlainMessageData;

  const factory MessageData.image({
    required String url,
    @Default(MessageDataType.image) MessageDataType type,
  }) = ImageMessageData;

  const factory MessageData.url({
    required String url,
    @Default(MessageDataType.url) MessageDataType type,
  }) = UrlMessageData;

  factory MessageData.fromJson(Json json) => _$MessageDataFromJson(json);
}
