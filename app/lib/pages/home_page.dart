import 'package:chat_life/index.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const _HomeAvatar(),
        centerTitle: false,
        title: const Wrap(
          direction: Axis.vertical,
          children: [
            Text('用户名'),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 4,
              children: [
                Badge(
                  backgroundColor: Colors.green,
                ),
                Text(
                  '在线',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      drawer: const HomeDrawer(),
      body: const BasedListView(
        children: [
          BasedListSection(
            children: [
              ChatListTile(),
              ChatListTile(),
              ChatListTile(),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatListTile extends StatefulWidget {
  const ChatListTile({
    super.key,
  });

  @override
  State<ChatListTile> createState() => _ChatListTileState();
}

class _ChatListTileState extends State<ChatListTile> {
  late types.Room room;

  @override
  void initState() {
    super.initState();
    const user = types.User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
      imageUrl: App.authorGitHubAvatar,
    );

    room = types.Room(
      id: randomString(),
      type: types.RoomType.group,
      users: const [user],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasedListTile(
      leading: const BasedAvatar(
        image: NetworkImage(App.authorGitHubAvatar),
      ),
      titleText: room.name ?? '',
      subtitleText: 'text',
      subtitleTextStyle: TextStyle(
        color: context.colorScheme.outline,
        fontSize: 12,
      ),
      trailing: const Badge(
        smallSize: 12,
        largeSize: 12,
        label: Text(
          '9999',
          style: TextStyle(fontSize: 8),
        ),
        child: Text(
          '22:21',
          style: TextStyle(fontSize: 12),
        ),
      ),
      onTap: () => context.push(
        ChatPage(id: room.id),
      ),
    );
  }
}

class _HomeAvatar extends StatelessWidget {
  const _HomeAvatar();

  @override
  Widget build(BuildContext context) {
    return BasedAvatar(
      onTap: Scaffold.of(context).openDrawer,
    );
  }
}
