import 'package:chat_life/index.dart';

extension BuildContextExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) => splitViewKey.currentState!
      .push(CupertinoPageRoute<T>(builder: (_) => page));

  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Brightness get brightness => colorScheme.brightness;
}
