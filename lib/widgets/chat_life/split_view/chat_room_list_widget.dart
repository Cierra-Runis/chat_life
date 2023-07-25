import 'package:chat_life/index.dart';

class ChatRoomListWidget extends StatelessWidget {
  const ChatRoomListWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return user.userRooms.isEmpty
        ? const Center(child: Text('暂无消息'))
        : BaseListWidget(
            children: [
              for (final roomId in user.userRooms)
                FutureBuilder(
                  future: isarService.getRoomById(roomId.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ChatRoomListItemWidget(
                        user: user,
                        room: snapshot.data!,
                      );
                    }
                    return const ChatRoomListItemShimmerWidget();
                  },
                ),
            ],
          );
  }
}
