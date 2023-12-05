import 'package:chat_life/index.dart';
import 'dart:developer' as devtools show log, inspect;

abstract class App {
  static const name = 'ChatLife';
  static const fontTorus = 'Torus';
  static const fontCascadiaCodePL = 'CascadiaCodePL';
  static const fontMiSans = 'MiSans';

  static const authorGitHubAvatar =
      'https://avatars.githubusercontent.com/u/29329988';

  static void printLog(
    dynamic log, {
    Object? inspect,
    Object? error,
    StackTrace? stackTrace,
  }) {
    devtools.log(
      '$log',
      name: name,
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
    if (inspect != null) devtools.inspect(inspect);
  }

  static void run() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// 在 Windows 上启动窗口管理
    if (Platform.isWindows) {
      await PlatformWindowsManager.init();
      await PlatformWindowsTray.init();
    }

    /// 在 Android 上实现高刷
    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }

    runApp(
      ProviderScope(
        observers: const [_ProviderObserver()],
        overrides: [
          persistenceProvider.overrideWithValue(
            await Persistence.init(),
          ),
          colorSchemesProvider.overrideWithValue(
            await ColorSchemes.init(),
          ),
        ],
        child: const ChatLifeApp(),
      ),
    );
  }
}

class PlatformWindowsManager {
  static Future<void> init() async {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      title: App.name,
      minimumSize: Size(400, 400),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () {
      windowManager.show();
      windowManager.focus();
    });
  }

  static void switchMaximized() async {
    if (await windowManager.isMaximized()) {
      windowManager.unmaximize();
    } else {
      windowManager.maximize();
    }
  }
}

class PlatformWindowsTray {
  static Future<void> init() async {
    final systemTray = SystemTray();

    await systemTray.initSystemTray(
      title: App.name,
      toolTip: App.name,
      iconPath: 'assets/images/app_icon.ico',
    );

    /// TODO: Add menu

    systemTray.registerSystemTrayEventHandler((eventName) async {
      switch (eventName) {
        case kSystemTrayEventClick:
          {
            windowManager.show();
          }
        case kSystemTrayEventRightClick:
          {
            systemTray.popUpContextMenu();
          }
      }
    });
  }
}

class _Inspect {
  const _Inspect({
    required this.provider,
    required this.container,
    this.value,
    this.previousValue,
    this.newValue,
  });
  final ProviderBase<Object?> provider;
  final Object? value;
  final Object? previousValue;
  final Object? newValue;
  final ProviderContainer container;
}

class _ProviderObserver extends ProviderObserver {
  /// An object that listens to the changes of a [ProviderContainer].
  ///
  /// This can be used for logging or making devtools.
  const _ProviderObserver();

  /// A provider was initialized, and the value exposed is [value].
  ///
  /// [value] will be `null` if the provider threw during initialization.
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) =>
      App.printLog(
        'didAddProvider: ${provider.name}',
        inspect: _Inspect(
          provider: provider,
          value: value,
          container: container,
        ),
      );

  /// A provider emitted an error, be it by throwing during initialization
  /// or by having a [Future]/[Stream] emit an error
  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) =>
      App.printLog(
        'providerDidFail: ${provider.name}',
        error: error,
        stackTrace: stackTrace,
        inspect: _Inspect(
          provider: provider,
          container: container,
        ),
      );

  /// Called by providers when they emit a notification.
  ///
  /// - [newValue] will be `null` if the provider threw during initialization.
  /// - [previousValue] will be `null` if the previous build threw during initialization.
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) =>
      App.printLog(
        'didUpdateProvider: ${provider.name}',
        inspect: _Inspect(
          provider: provider,
          container: container,
          previousValue: previousValue,
          newValue: newValue,
        ),
      );

  /// A provider was disposed
  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) =>
      App.printLog(
        'didDisposeProvider: ${provider.name}',
        inspect: _Inspect(
          provider: provider,
          container: container,
        ),
      );
}
