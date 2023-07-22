import 'package:chat_life/index.dart';

class BaseAvatarWidget extends StatelessWidget {
  const BaseAvatarWidget({
    super.key,
    required this.icon,
    this.isGrey = false,
    this.size = 40,
    this.onTap,
    this.onLongPress,
  });

  final String icon;
  final bool isGrey;
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
          child: Image.asset(
            icon,
            cacheWidth: size,
            color: isGrey ? Colors.grey : null,
            colorBlendMode: BlendMode.color,
          ),
        ),
      ),
    );
  }
}
