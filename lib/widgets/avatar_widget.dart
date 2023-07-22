import 'package:chat_life/index.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.icon,
    this.size = 40,
    this.onTap,
    this.onLongPress,
  });

  final String icon;
  final int size;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Colors.transparent,
      child: Material(
        type: MaterialType.card,
        borderRadius: BorderRadius.circular(size / 2),
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Image.asset(icon, cacheWidth: size),
        ),
      ),
    );
  }
}
