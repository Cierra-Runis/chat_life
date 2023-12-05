import 'package:chat_life/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'color_schemes.g.dart';
part 'color_schemes.freezed.dart';

@Riverpod(keepAlive: true)
ColorSchemes colorSchemes(ColorSchemesRef ref) =>
    throw Exception('colorSchemesProvider not initialized');

/// [ColorSchemes]
@freezed
class ColorSchemes with _$ColorSchemes {
  const ColorSchemes._();

  const factory ColorSchemes({
    required ColorScheme light,
    required ColorScheme dark,
  }) = _ColorSchemes;

  static Future<ColorSchemes> init() async {
    final palette = await DynamicColorPlugin.getCorePalette();

    final seedColor =
        await DynamicColorPlugin.getAccentColor() ?? Colors.deepPurple;

    final light = palette?.toColorScheme(brightness: Brightness.light) ??
        ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        );

    final dark = palette?.toColorScheme(brightness: Brightness.dark) ??
        ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        );

    return ColorSchemes(light: light, dark: dark);
  }
}
