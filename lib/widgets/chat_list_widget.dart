import 'package:chat_life/index.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      flex: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Builder(
              builder: (context) => AvatarWidget(
                icon: user.icon,
                onTap: Scaffold.of(context).openDrawer,
                onLongPress: () {
                  chatAppGlobalKey.currentState?.popUntil(
                    (route) => route.isFirst,
                  );
                  showModalBottomSheet(
                    context: chatAppGlobalKey.currentContext!,
                    showDragHandle: true,
                    builder: (context) => ChatBottomSheetWidget(
                      user: user,
                    ),
                  );
                },
              ),
            ),
          ),
          centerTitle: false,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('chaos', style: TextStyle(fontSize: 18)),
              Wrap(
                spacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Badge(badgeStyle: BadgeStyle(badgeColor: Colors.green)),
                  Text('在线', style: TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_rounded,
              ),
            )
          ],
        ),
        drawer: ChatDrawerWidget(user: user),
        backgroundColor: colorScheme.surface,
        body: MercuriusListWidget(
          children: [
            for (final roomId in user.userRooms)
              FutureBuilder(
                future: isarService.getRoomById(roomId.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ChatListItem(user: user, room: snapshot.data!);
                  }
                  return const ChatListShimmerItem();
                },
              ),
          ],
        ),
      ),
    );
  }
}

class ChatListShimmerItem extends StatelessWidget {
  const ChatListShimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MercuriusListItemWidget(
      icon: MercuriusFadeShimmerWidget.round(size: 40),
      title: MercuriusFadeShimmerWidget(
        width: 60,
        height: 14,
        radius: 7,
      ),
      summary: MercuriusFadeShimmerWidget(
        width: 180,
        height: 14,
        radius: 7,
      ),
      accessoryView: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 2,
        children: [
          MercuriusFadeShimmerWidget(
            width: 20,
            height: 10,
            radius: 5,
          ),
          MercuriusFadeShimmerWidget.round(size: 10)
        ],
      ),
    );
  }
}
