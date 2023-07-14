import 'package:chat_life/index.dart';

extension DateTimeExtension on DateTime {
  bool get isDay => hour >= 6 && hour <= 18;

  Brightness get brightness => isDay ? Brightness.light : Brightness.dark;
}
