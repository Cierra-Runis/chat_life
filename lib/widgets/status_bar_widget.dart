import 'package:chat_life/index.dart';

class StatusBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const StatusBarWidget({
    super.key,
    required this.dateTime,
    this.backgroundColor,
  });

  final DateTime dateTime;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size(double.infinity, 40);

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).toLanguageTag();

    const TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    return Container(
      color: backgroundColor,
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
                    dateTime.format(DateFormat.HOUR24_MINUTE, lang),
                    style: style,
                  ),
                  Text(
                    dateTime.format(DateFormat.ABBR_MONTH_WEEKDAY_DAY, lang),
                    style: style,
                  )
                ],
              ),
            ),
            const Icon(Icons.more_horiz_rounded),
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Wrap(
                spacing: 4.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(CupertinoIcons.wifi, size: 16),
                  Icon(CupertinoIcons.lock_rotation, size: 12),
                  Text('100%', style: style),
                  Icon(CupertinoIcons.battery_100, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
