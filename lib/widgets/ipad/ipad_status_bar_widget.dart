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
        onPanStart: (_) => windowManager.startDragging(),
        onDoubleTap: windowManager.center,
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
            const Icon(Icons.more_horiz_rounded),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Wrap(
                spacing: 4.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(CupertinoIcons.wifi, size: 16),
                  const Icon(CupertinoIcons.lock_rotation, size: 12),
                  Text('${ipadStatus.battery}%', style: style),
                  IpadBatteryWidget(
                    value: ipadStatus.battery / 100,
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
