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

    return BasedListTile(
      leading: BasedAvatar(image: NetworkImage(room.icon)),
      titleText: room.title,
      detailText: messages.lastOrNull?.content ?? '',
      trailing: Column(
        children: [
          Text(
            messages.lastOrNull?.sendDateTime.format(DateFormat.HOUR_MINUTE) ??
                'Null',
            style: const TextStyle(fontSize: 12),
          ),
          Badge(
            // isLabelVisible: messages.isNotEmpty,
            smallSize: 14,
            largeSize: 14,
            label: Text(
              '${messages.length}',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      onTap: () => context.push(
        chatViewWidget,
      ),
    );
  }
}
