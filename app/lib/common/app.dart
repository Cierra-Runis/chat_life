import 'package:chat_life/index.dart';
import 'dart:developer' as devtools show log;

abstract class App {
  static const name = 'ChatLife';
  static const fontTorus = 'Torus';
  static const fontCascadiaCodePL = 'CascadiaCodePL';
  static const fontMiSans = 'MiSans';

  static const authorGitHubAvatar =
      'https://avatars.githubusercontent.com/u/29329988';

  static void printLog(dynamic log) =>
      devtools.log('$log', name: name, time: DateTime.now());

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

    final palette = await DynamicColorPlugin.getCorePalette();
    final seedColor =
        await DynamicColorPlugin.getAccentColor() ?? Colors.deepPurple;

    colorScheme = palette?.toColorScheme(brightness: Brightness.light) ??
        ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        );

    darkColorScheme = palette?.toColorScheme(brightness: Brightness.dark) ??
        ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        );

    runApp(const MyApp());
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
