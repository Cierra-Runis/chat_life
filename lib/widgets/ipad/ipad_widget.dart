import 'package:chat_life/index.dart';

class IpadWidget extends StatefulWidget {
  const IpadWidget({
    super.key,
    required this.ipadStatus,
    required this.currentApp,
  });

  final IpadStatus ipadStatus;
  final Widget currentApp;

  @override
  State<IpadWidget> createState() => IpadWidgetState();
}

class IpadWidgetState extends State<IpadWidget> {
  static const double barPositionBreakPoint = 0;
  static const double barPositionUpperBound = 40;
  static const double barPositionLowerBound = -64;

  double _barPosition = barPositionLowerBound;

  late OverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: hide,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            IpadDockWidget(
              bottom: _barPosition,
              onVerticalDragStart: onVerticalDragStart,
              onVerticalDragUpdate: onVerticalDragUpdate,
              onVerticalDragEnd: onVerticalDragEnd,
            ),
          ],
        );
      },
    );
  }

  void hide() {
    setState(() {
      _barPosition = barPositionLowerBound;
      overlayEntry.markNeedsBuild();
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      if (overlayEntry.mounted) overlayEntry.remove();
    });
  }

  void onVerticalDragStart(DragStartDetails details) {
    OverlayState overlayState = Overlay.of(context);
    if (overlayEntry.mounted) return;
    overlayState.insert(overlayEntry);
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (_barPosition >= barPositionUpperBound) {
        _barPosition = barPositionUpperBound;
      }
      if (_barPosition < barPositionLowerBound) {
        _barPosition = barPositionLowerBound;
      }
      _barPosition -= details.delta.dy;
      overlayEntry.markNeedsBuild();
    });
  }

  void onVerticalDragEnd(DragEndDetails details) {
    if (_barPosition > barPositionBreakPoint) {
      return setState(() {
        _barPosition = barPositionUpperBound;
        overlayEntry.markNeedsBuild();
      });
    }
    if (_barPosition <= barPositionBreakPoint) {
      setState(() {
        _barPosition = barPositionLowerBound;
        overlayEntry.markNeedsBuild();
      });
      Future.delayed(const Duration(milliseconds: 200), () {
        if (overlayEntry.mounted) overlayEntry.remove();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IpadStatusBarWidget(
        ipadStatus: widget.ipadStatus,
      ),
      extendBodyBehindAppBar: true,
      body: Scaffold(
        body: Stack(
          children: [
            widget.currentApp,
            IpadDockBarWidget(
              onVerticalDragStart: onVerticalDragStart,
              onVerticalDragUpdate: onVerticalDragUpdate,
              onVerticalDragEnd: onVerticalDragEnd,
            ),
          ],
        ),
      ),
    );
  }
}

class IpadDockWidget extends StatelessWidget {
  const IpadDockWidget({
    super.key,
    required this.bottom,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
  });

  final double bottom;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      bottom: bottom,
      curve: Curves.ease,
      left: 24,
      right: 24,
      child: GestureDetector(
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: onVerticalDragEnd,
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: colorScheme.outlineVariant.withAlpha(32),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BaseAvatarWidget(
                    onTap: () {},
                    size: 48,
                    radius: 48 / 3,
                    icon: 'assets/images/chaos.jpg',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
