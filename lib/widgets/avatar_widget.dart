import 'package:chat_life/index.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.onLongPress,
  });

  final String icon;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Material(
        type: MaterialType.card,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Image.asset(icon, cacheWidth: 40),
        ),
      ),
    );
  }
}
