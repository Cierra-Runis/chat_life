import 'package:chat_life/index.dart';

class BaseAvatarWidget extends StatelessWidget {
  const BaseAvatarWidget({
    super.key,
    required this.icon,
    this.isGrey = false,
    this.size = 40,
    this.radius,
    this.onTap,
    this.onLongPress,
  });

  final String icon;
  final bool isGrey;
  final double size;
  final double? radius;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Colors.transparent,
      child: Material(
        type: MaterialType.card,
        borderRadius: BorderRadius.circular(radius ?? size),
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Image.asset(
            icon,
            color: isGrey ? Colors.grey : null,
            colorBlendMode: BlendMode.color,
          ),
        ),
      ),
    );
  }
}
