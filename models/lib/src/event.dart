import 'package:models/index.dart';
part 'event.g.dart';
part 'event.freezed.dart';

@Freezed(unionKey: 'type')
sealed class Event with _$Event {
  const Event._();

  const factory Event.message() = MessageEvent;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
