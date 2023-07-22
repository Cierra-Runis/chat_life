import 'package:chat_life/index.dart';

class ChatViewSettingWidget extends StatelessWidget {
  const ChatViewSettingWidget({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final String title = room.type == RoomType.group ? '群聊设置' : '聊天设置';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: MercuriusListWidget(
        children: [
          MercuriusListSectionWidget(
            children: [
              MercuriusListItemWidget(
                icon: CircleAvatar(
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
