import 'package:models/index.dart';
part 'event.g.dart';
part 'event.freezed.dart';

/// [EventType] for identify [Event]
enum EventType {
  /// [TextMessage]
  message
}

/// [Event]
@Freezed(unionKey: 'type')
sealed class Event with _$Event {
  const Event._();

  const factory Event.message({
    required Message message,
    @Default(EventType.message) EventType type,
  }) = MessageEvent;

  factory Event.fromJson(Json json) => _$EventFromJson(json);
}
