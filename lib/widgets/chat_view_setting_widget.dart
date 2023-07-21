import 'package:chat_life/index.dart';

class ChatViewSettingWidget extends StatelessWidget {
  const ChatViewSettingWidget({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('群聊设置'),
        centerTitle: true,
      ),
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
