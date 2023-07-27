import 'package:chat_life/index.dart';

class IpadStatusBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const IpadStatusBarWidget({
    super.key,
    required this.ipadStatus,
  });

  final IpadStatus ipadStatus;

  @override
  Size get preferredSize => const Size(double.infinity, 30);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).toLanguageTag();

    final colorScheme = Theme.of(context).colorScheme;

    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    return SizedBox(
      height: 30,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: WindowsPlatform.switchMaximize,
        onPanStart: WindowsPlatform.startDragging,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Wrap(
                  spacing: 8.0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      ipadStatus.dateTime.format(
                        DateFormat.HOUR24_MINUTE_SECOND,
                        lang,
                      ),
                      style: style,
                    ),
                    Text(
                      ipadStatus.dateTime.format(
                        DateFormat.ABBR_MONTH_WEEKDAY_DAY,
                        lang,
                      ),
                      style: style,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: StarMenu(
                params: StarMenuParameters.dropdown(context).copyWith(
                  boundaryBackground: BoundaryBackground(
                    blurSigmaX: 4,
                    blurSigmaY: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: colorScheme.outlineVariant.withAlpha(32),
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
                  bool isFullScreen = await MultiPlatform.isFullScreen();
                  return [
                    BaseChipWidget(
                      label: '全屏幕',
                      labelWidth: 160,
                      leadingIconData:
                          isFullScreen ? CupertinoIcons.check_mark : null,
                      tracingIconData: Icons.crop_5_4_rounded,
                      onTap: () => MultiPlatform.setFullScreen(!isFullScreen),
                    ),
                    const BaseChipWidget(
                      label: '关闭',
                      labelWidth: 160,
                      labelColor: Colors.red,
                      fontWeight: FontWeight.bold,
                      tracingIconData: Icons.close_rounded,
                      tracingIconColor: Colors.red,
                      onTap: MultiPlatform.close,
                    ),
                  ];
                },
                child: const Icon(CupertinoIcons.ellipsis),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Wrap(
                  spacing: 4.0,
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.wifi, size: 12),
                    const Icon(CupertinoIcons.lock_rotation, size: 12),
                    Text('${ipadStatus.batteryStatus.value}%', style: style),
                    BasedBatteryIndicator(
                      status: ipadStatus.batteryStatus,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
