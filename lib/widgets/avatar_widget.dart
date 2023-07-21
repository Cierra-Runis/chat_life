import 'package:chat_life/index.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.icon,
    this.onTap,
  });

  final String icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Material(
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(icon, cacheWidth: 40),
          ),
        ),
      ),
    );
  }
}
