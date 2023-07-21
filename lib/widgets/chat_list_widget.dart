import 'package:chat_life/index.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: AvatarWidget(
              icon: user.icon,
              onTap: () => ChatLife.printLog('newLog'),
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: const MercuriusListWidget(
          children: [
            ChatListItem(
              room: Room(
                type: RoomType.group,
                title: '精神病院',
                icon: 'assets/images/chaos.jpg',
                users: [
                  User(
                    uuid: 43967184365,
                    icon: 'assets/images/chaos.jpg',
                    name: 'chaos',
                  ),
                  User(
                    uuid: 54284364881,
                    icon: 'assets/images/chaos.jpg',
                    name: 'chaos',
                  ),
                ],
                messages: ['你好'],
                unreadMessages: ['杀软', '司马', '鹅鹅鹅'],
              ),
            ),
            ChatListItem(
              room: Room(
                type: RoomType.group,
                title: '病院',
                icon: 'assets/images/noRi.jpg',
                users: [
                  User(
                    uuid: 43967184365,
                    icon: 'assets/images/chaos.jpg',
                    name: 'chaos',
                  ),
                  User(
                    uuid: 86732656760,
                    icon: 'assets/images/noRi.jpg',
                    name: 'noRi',
                  ),
                  User(
                    uuid: 64387316946,
                    icon: 'assets/images/orange.jpg',
                    name: 'orange',
                  ),
                ],
                messages: [],
                unreadMessages: ['!'],
              ),
            ),
            ChatListItem(
              room: Room(
                type: RoomType.pm,
                title: '精院',
                icon: 'assets/images/orange.jpg',
                users: [
                  User(
                    uuid: 43967184365,
                    icon: 'assets/images/chaos.jpg',
                    name: 'chaos',
                  ),
                  User(
                    uuid: 64387316946,
                    icon: 'assets/images/orange.jpg',
                    name: 'orange',
                  ),
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
