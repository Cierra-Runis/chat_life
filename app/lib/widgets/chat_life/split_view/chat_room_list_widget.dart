import 'package:chat_life/index.dart';

class ChatRoomListWidget extends StatelessWidget {
  const ChatRoomListWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return user.userRoomIds.isEmpty
        ? const Center(child: Text('暂无消息'))
        : BasedListView(
            children: [
              for (final roomId in user.userRoomIds)
                FutureBuilder(
                  future: isarService.getRoomById(roomId),
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
