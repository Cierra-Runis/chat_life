import 'package:chat_life/index.dart';

class ChatLifeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatLifeAppBar({super.key});

  static const _appBarHeight = 28.0;
  static const _actionSize = 16.0;
  static const _actionWidth = _actionSize * 2;

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: toggleMaximized,
      onPanStart: (details) => windowManager.startDragging(),
      child: AppBar(
        toolbarHeight: preferredSize.height,
        actions: [
          MaterialButton(
            onPressed: windowManager.minimize,
            minWidth: _actionWidth,
            child: const Icon(
              Icons.remove_rounded,
              size: _actionSize,
            ),
          ),
          MaterialButton(
            onPressed: toggleMaximized,
            minWidth: _actionWidth,
            child: const Icon(
              Icons.fullscreen_rounded,
              size: _actionSize,
            ),
          ),
          MaterialButton(
            onPressed: windowManager.hide,
            hoverColor: Colors.red,
            minWidth: _actionWidth,
            child: const Icon(
              Icons.close_rounded,
              size: _actionSize,
            ),
          ),
        ],
      ),
    );
  }

  void toggleMaximized() async => await windowManager.isMaximized()
      ? windowManager.unmaximize()
      : windowManager.maximize();
}
