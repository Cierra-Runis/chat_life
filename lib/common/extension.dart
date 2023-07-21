import 'package:chat_life/index.dart';

extension DateTimeExtension on DateTime {
  bool get isDay => isAfter(copyWith(hour: 6)) && isBefore(copyWith(hour: 18));

  Brightness get brightness => isDay ? Brightness.light : Brightness.dark;
}
