import 'package:chat_life/index.dart';

class ChatRoomSettingWidget extends StatelessWidget {
  const ChatRoomSettingWidget({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final String title = room.type == RoomType.group ? '群聊设置' : '聊天设置';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BasedListView(
        children: [
          BasedListSection(
            children: [
              BasedListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      room.icon,
                      cacheWidth: 40,
                    ),
                  ),
                ),
                titleText: room.title,
              )
            ],
          )
        ],
      ),
    );
  }
}
