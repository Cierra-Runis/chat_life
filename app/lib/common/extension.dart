import 'package:chat_life/index.dart';

extension DateTimeExtension on DateTime {
  bool get isDay =>
      !isBefore(copyWith(hour: 6)) && isBefore(copyWith(hour: 18));

  Brightness get brightness => isDay ? Brightness.light : Brightness.dark;
}

extension BuildContextExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) => splitViewKey.currentState!
      .push(CupertinoPageRoute<T>(builder: (_) => page));

  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);
}

extension NumExtension on num {
  /// [a, b]
  bool isIn(num a, num b) => a <= this && this <= b;
}
