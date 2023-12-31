import 'package:chat_life/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'settings.g.dart';
part 'settings.freezed.dart';

/// Add abstracts layer extension to [Persistence]
///
/// Naming the new keys, and provide default set/get methods
extension _Ext on Persistence {
  static const themeMode = '${Persistence.prefix}_themeMode';
  static const bgImgPath = '${Persistence.prefix}_bgImgPath';
  static const apiBaseUrl = '${Persistence.prefix}_apiBaseUrl';
  static const wsBaseUrl = '${Persistence.prefix}_wsBaseUrl';
  static const defaultApiBaseUrl = 'http://localhost:8080';
  static const defaultWsBaseUrl = 'ws://localhost:8080';

  ThemeMode getThemeMode() => ThemeMode.values.firstWhere(
        (element) => element.name == sp.getString(themeMode),
        orElse: () => ThemeMode.system,
      );
  Future<void> setThemeMode(ThemeMode value) async =>
      await sp.setString(themeMode, value.name);

  String getApiBaseUrl() => sp.getString(apiBaseUrl) ?? defaultApiBaseUrl;

  Future<void> setApiBaseUrl(String value) async =>
      await sp.setString(apiBaseUrl, value);

  String getWsBaseUrl() => sp.getString(wsBaseUrl) ?? defaultWsBaseUrl;

  Future<void> setWsBaseUrl(String value) async =>
      await sp.setString(wsBaseUrl, value);
}

/// State which return by [ref.watch]
///
/// It contains [toString], [fromJson], [toJson], [copyWith] methods
@freezed
class SettingsState with _$SettingsState {
  const SettingsState._();

  const factory SettingsState({
    @JsonKey(name: _Ext.themeMode) required ThemeMode themeMode,
    @JsonKey(name: _Ext.bgImgPath) String? bgImgPath,
    @JsonKey(name: _Ext.apiBaseUrl) required String apiBaseUrl,
    @JsonKey(name: _Ext.wsBaseUrl) required String wsBaseUrl,
  }) = _SettingsState;

  factory SettingsState.fromJson(Json json) => _$SettingsStateFromJson(json);
}

/// State management
///
/// By watching [persistenceProvider],
/// its state reacts when [Persistence] change
@riverpod
class Settings extends _$Settings {
  late final Persistence _pers;

  @override
  SettingsState build() {
    _pers = ref.watch(persistenceProvider);
    return SettingsState(
      themeMode: _pers.getThemeMode(),
      apiBaseUrl: _pers.getApiBaseUrl(),
      wsBaseUrl: _pers.getWsBaseUrl(),
    );
  }

  static const themeModeIcon = {
    ThemeMode.system: Icons.brightness_auto_rounded,
    ThemeMode.light: Icons.light_mode_rounded,
    ThemeMode.dark: Icons.dark_mode_rounded,
  };

  Future<void> setThemeMode(ThemeMode value) async {
    await _pers.setThemeMode(value);
    state = state.copyWith(themeMode: value);
  }

  Future<void> loopThemeMode() async {
    final modes = themeModeIcon.keys.toList();
    final currentIndex = modes.indexOf(state.themeMode);
    final nextIndex = (currentIndex + 1) % modes.length;
    final nextMode = modes.elementAt(nextIndex);
    setThemeMode(nextMode);
  }

  Future<void> setApiBaseUrl(String value) async {
    await _pers.setApiBaseUrl(value);
    state = state.copyWith(apiBaseUrl: value);
  }

  Future<void> setWsBaseUrl(String value) async {
    await _pers.setWsBaseUrl(value);
    state = state.copyWith(wsBaseUrl: value);
  }
}
