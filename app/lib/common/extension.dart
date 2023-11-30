import 'package:chat_life/index.dart';

extension BuildContextExt on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) =>
      (splitViewKey.currentState ?? Navigator.of(this))
          .push(CupertinoPageRoute<T>(builder: (_) => page));

  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Brightness get brightness => colorScheme.brightness;
}

extension SliverExt on Widget {
  Widget get adaptSliver => SliverToBoxAdapter(child: this);
}

extension BrightnessExt on Brightness {
  bool get isDark => this == Brightness.dark;
  bool get isLight => this == Brightness.light;
}

abstract class Bytes {
  static String format({
    required int bytes,
    int decimals = 2,
  }) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    final i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}

extension FileSystemEntityExtension on FileSystemEntity {
  int getBytes() {
    if (this is File) return File(path).lengthSync();
    if (this is Directory) return Directory(path).getBytes();
    return 0;
  }
}

extension DirectoryExtension on Directory {
  int getBytes() {
    var sum = 0;
    for (final file in listSync()) {
      sum += file.getBytes();
    }
    return sum;
  }
}
