import 'package:chat_life/index.dart';

class MultiPlatform {
  static Future<void> init() async {
    ChatLife.printLog('初始化 MultiPlatform 设置中');
    if (Platform.isWindows) return WindowsPlatform.init();
    if (Platform.isAndroid) return AndroidPlatform.init();
    throw Exception('UnSupport Platform');
  }

  static Future<bool> isFullScreen() async {
    if (Platform.isAndroid) return true;
    if (Platform.isWindows) return windowManager.isFullScreen();
    throw Exception('UnSupport Platform');
  }

  static Future<void> setFullScreen(bool isFullScreen) async {
    if (Platform.isAndroid) return;
    if (Platform.isWindows) return windowManager.setFullScreen(isFullScreen);
    throw Exception('UnSupport Platform');
  }

  static Future<void> close() async {
    if (Platform.isAndroid) {
      return SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    if (Platform.isWindows) return windowManager.close();
    throw Exception('UnSupport Platform');
  }
}

class WindowsPlatform {
  static Future<void> init() async {
    ChatLife.printLog('初始化 WindowsPlatform 设置中');

    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      title: ChatLife.appName,
      size: Size(1280, 894),
      minimumSize: Size(894 / 2, 894),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () {
      windowManager.show();
      windowManager.focus();
    });

    ChatLife.printLog('初始化 WindowsPlatform 设置完毕');
  }

  static Future<void> switchMaximize() async {
    if (!Platform.isWindows) return;
    if (await windowManager.isMaximized()) {
      windowManager.unmaximize();
    } else {
      windowManager.maximize();
    }
  }

  static Future<void> startDragging(DragStartDetails details) async {
    if (!Platform.isWindows) return;
    windowManager.startDragging();
  }
}

class AndroidPlatform {
  static Future<void> init() async {
    ChatLife.printLog('初始化 AndroidPlatform 设置中');

    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );

    ChatLife.printLog('初始化 AndroidPlatform 设置完毕');
  }
}
