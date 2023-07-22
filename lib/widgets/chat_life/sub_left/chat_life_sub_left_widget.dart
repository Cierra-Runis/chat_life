import 'package:chat_life/index.dart';

class ChatLifeSubLeftWidget extends StatefulWidget {
  const ChatLifeSubLeftWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<ChatLifeSubLeftWidget> createState() => _ChatLifeSubLeftWidgetState();
}

class _ChatLifeSubLeftWidgetState extends State<ChatLifeSubLeftWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final status = widget.user.status;

    return Expanded(
      flex: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Builder(
              builder: (context) => BaseAvatarWidget(
                icon: widget.user.icon,
                onTap: Scaffold.of(context).openDrawer,
                onLongPress: () {
                  chatAppGlobalKey.currentState?.popUntil(
                    (route) => route.isFirst,
                  );
                  showModalBottomSheet(
                    context: chatAppGlobalKey.currentContext!,
                    showDragHandle: true,
                    builder: (context) => ChatLifeBottomSheetWidget(
                      user: widget.user,
                    ),
                  );
                },
              ),
            ),
          ),
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('chaos', style: TextStyle(fontSize: 18)),
              Wrap(
                spacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Badge(
                    badgeStyle: BadgeStyle(
                      badgeColor: status.isOnline ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    status.label,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          actions: [
            StarMenu(
              params: StarMenuParameters.dropdown(context).copyWith(
                linearShapeParams: const LinearShapeParams(
                  space: 4,
                  angle: -90,
                  alignment: LinearAlignment.left,
                ),
                startItemScaleAnimation: 0,
                closeDurationMs: 200,
              ),
              items: [
                BaseChipWidget(
                  iconData: Icons.add_comment_rounded,
                  label: '创建群聊',
                  onPressed: () {},
                ),
                BaseChipWidget(
                  iconData: Icons.person_add_alt_1_outlined,
                  label: '加好友/群',
                  onPressed: () {},
                ),
              ],
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.add_rounded),
              ),
            )
          ],
        ),
        drawer: ChatLifeSubRightDrawerWidget(user: widget.user),
        backgroundColor: colorScheme.surface,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: [
            ChatRoomListWidget(user: widget.user),
            ChatPersonListWidget(user: widget.user),
          ][_selectedIndex],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.messenger_outline),
              selectedIcon: Icon(Icons.message_rounded),
              label: '消息',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person_rounded),
              label: '联系人',
            )
          ],
          onDestinationSelected: (value) {
            chatAppGlobalKey.currentState?.popUntil((route) => route.isFirst);
            setState(() => _selectedIndex = value);
          },
        ),
      ),
    );
  }
}
