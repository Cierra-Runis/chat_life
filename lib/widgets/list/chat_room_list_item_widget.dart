import 'package:chat_life/index.dart';

class ChatRoomListItemWidget extends StatelessWidget {
  const ChatRoomListItemWidget({
    super.key,
    required this.user,
    required this.room,
  });

  final User user;
  final Room room;

  @override
  Widget build(BuildContext context) {
    final chatViewWidget = ChatRoomWidget(room: room);

    final messages = room.messages.toList();

    return BaseListItemWidget(
      icon: BaseAvatarWidget(icon: room.icon),
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
      onTap: () => BaseSplitViewWidget.of(context).setSecondary(chatViewWidget),
    );
  }
}
