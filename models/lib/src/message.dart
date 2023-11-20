import 'package:models/index.dart';
part 'message.g.dart';
part 'message.freezed.dart';

@Freezed(unionKey: 'type')
sealed class Message with _$Message {
  const factory Message.text({
    required String id,
    required MessageType type,
    required List<TextMessageData> data,
  }) = TextMessage;

  const factory Message.image({
    required String id,
    required MessageType type,
    required String url,
  }) = ImageMessage;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

/// unionKey
enum MessageType {
  /// identify to [TextMessage]
  text,

  /// identify to [ImageMessage]
  image
}

enum TextMessageDataType { plain, image, url }

typedef TextMessageData = Map<TextMessageDataType, String>;
