import 'package:chat_life/index.dart';

class IpadStatusBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const IpadStatusBarWidget({
    super.key,
    required this.ipadStatus,
  });

  final IpadStatus ipadStatus;

  @override
  Size get preferredSize => const Size(double.infinity, 40);

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).toLanguageTag();

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    const TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    return Container(
      color: colorScheme.background,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: () async {
          if (await windowManager.isMaximized()) {
            windowManager.unmaximize();
          } else {
            windowManager.maximize();
          }
        },
        onPanStart: (_) => windowManager.startDragging(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Wrap(
                spacing: 8.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    ipadStatus.dateTime.format(DateFormat.HOUR24_MINUTE, lang),
                    style: style,
                  ),
                  Text(
                    ipadStatus.dateTime
                        .format(DateFormat.ABBR_MONTH_WEEKDAY_DAY, lang),
                    style: style,
                  )
                ],
              ),
            ),
            StarMenu(
              params: StarMenuParameters.dropdown(context).copyWith(
                boundaryBackground: BoundaryBackground(
                  blurSigmaX: 18,
                  blurSigmaY: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: colorScheme.outlineVariant.withAlpha(128),
                  ),
                ),
                linearShapeParams: const LinearShapeParams(
                  space: 4,
                  angle: -90,
                ),
                centerOffset: const Offset(0, 40),
                closeDurationMs: 200,
              ),
              lazyItems: () async {
                bool isFullScreen = await windowManager.isFullScreen();
                return [
                  BaseChipWidget(
                    label: '全屏幕',
                    labelWidth: 160,
                    leadingIconData:
                        isFullScreen ? CupertinoIcons.check_mark : null,
                    tracingIconData: Icons.crop_5_4_rounded,
                    onTap: () => windowManager.setFullScreen(!isFullScreen),
                  ),
                  BaseChipWidget(
                    label: '关闭',
                    labelWidth: 160,
                    labelColor: Colors.red,
                    fontWeight: FontWeight.bold,
                    tracingIconData: Icons.close_rounded,
                    tracingIconColor: Colors.red,
                    onTap: windowManager.close,
                  ),
                ];
              },
              child: const Icon(CupertinoIcons.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Wrap(
                spacing: 4.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(CupertinoIcons.wifi, size: 16),
                  const Icon(CupertinoIcons.lock_rotation, size: 12),
                  Text('${ipadStatus.batteryStatus.value}%', style: style),
                  IpadBatteryWidget(
                    batteryStatus: ipadStatus.batteryStatus,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
