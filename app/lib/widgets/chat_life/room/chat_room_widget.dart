import 'package:chat_life/index.dart';

class ChatRoomWidget extends StatelessWidget {
  const ChatRoomWidget({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final String memberCount =
        room.type == RoomType.group ? '(${room.userIds.length})' : '';

    final List<Message> messages = room.messages.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(room.title + memberCount),
        actions: [
          EndDrawerButton(
            onPressed: () => context.push(
              ChatRoomSettingWidget(room: room),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(
            messages[index],
          ),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async => false,
          child: BasedListTile(
            enabled: false,
            titleText: messages[index].content,
          ),
        ),
      ),
    );
  }
}
