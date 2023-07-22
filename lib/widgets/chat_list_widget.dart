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
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width,
          shape: const BeveledRectangleBorder(),
          child: MercuriusListWidget(
            children: [
              MercuriusListItemWidget(
                icon: RawChip(
                  avatar: Icon(
                    Icons.calendar_month_rounded,
                    color: colorScheme.outline,
                  ),
                  side: BorderSide.none,
                  label: const Text('今天天气很好'),
                  onPressed: () {},
                ),
                accessoryView: const CloseButton(),
                bottomView: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: [
                      AvatarWidget(icon: user.icon),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: colorScheme.surface,
        body: const MercuriusListWidget(
          children: [
            ChatListItem(
              room: Room(
                id: 0,
                type: RoomType.group,
                title: '精神病院',
                icon: 'assets/images/chaos.jpg',
                userIds: [
                  43967184365,
                  54284364881,
                ],
                messages: ['你好'],
                unreadMessages: ['杀软', '司马', '鹅鹅鹅'],
              ),
            ),
            ChatListItem(
              room: Room(
                id: 1,
                type: RoomType.group,
                title: '病院',
                icon: 'assets/images/noRi.jpg',
                userIds: [
                  43967184365,
                  86732656760,
                  64387316946,
                ],
                messages: [],
                unreadMessages: ['!'],
              ),
            ),
            ChatListItem(
              room: Room(
                id: 3,
                type: RoomType.pm,
                title: '精院',
                icon: 'assets/images/orange.jpg',
                userIds: [
                  43967184365,
                  64387316946,
                ],
                messages: [],
                unreadMessages: ['呃呃呃呃'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
