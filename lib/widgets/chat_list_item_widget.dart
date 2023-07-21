import 'package:chat_life/index.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final chatViewWidget = ChatViewWidget(room: room);

    return MercuriusListItemWidget(
      icon: AvatarWidget(icon: room.icon),
      titleText: room.title,
      summaryText:
          room.unreadMessages.lastOrNull ?? room.messages.lastOrNull ?? '',
      accessoryView: Column(
        children: [
          const Text(
            '20:30',
            style: TextStyle(fontSize: 12),
          ),
          Badge(
            showBadge: room.unreadMessages.isNotEmpty,
            badgeContent: Text(
              '${room.unreadMessages.length}',
              style: const TextStyle(color: Colors.white),
            ),
            badgeStyle: BadgeStyle(
              shape: BadgeShape.circle,
              badgeColor: Theme.of(context).colorScheme.outlineVariant,
            ),
          )
        ],
      ),
      onTap: () {
        bool isRoot = chatAppGlobalKey.currentState?.canPop() == false;
        if (isRoot) {
          chatAppGlobalKey.currentState?.push(
            CupertinoPageRoute<void>(builder: (context) => chatViewWidget),
          );
        } else {
          chatAppGlobalKey.currentState?.pushReplacement(
            PageRouteBuilder<void>(
              pageBuilder: (context, animation, secondaryAnimation) {
                return chatViewWidget;
              },
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                switch (animation.status) {
                  case AnimationStatus.forward:
                    return FadeTransition(opacity: animation, child: child);
                  case AnimationStatus.reverse:
                    return CupertinoPageTransition(
                      primaryRouteAnimation: animation,
                      secondaryRouteAnimation: secondaryAnimation,
                      linearTransition: false,
                      child: child,
                    );
                  default:
                    return child;
                }
              },
            ),
          );
        }
      },
    );
  }
}
