import 'package:chat_life/index.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    super.key,
    required this.user,
    required this.room,
  });

  final User user;
  final Room room;

  @override
  Widget build(BuildContext context) {
    final chatViewWidget = ChatViewWidget(room: room);

    final messages = room.messages.toList();

    return MercuriusListItemWidget(
      icon: AvatarWidget(icon: room.icon),
      titleText: room.title,
      summaryText: messages.lastOrNull?.content ?? '',
      accessoryView: Column(
        children: [
          const Text(
            '20:30',
            style: TextStyle(fontSize: 12),
          ),
          Badge(
            showBadge: messages.isNotEmpty,
            badgeContent: Text(
              '${messages.length}',
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
            ChatLifePageRouteWidget(page: chatViewWidget),
          );
        }
      },
    );
  }
}
