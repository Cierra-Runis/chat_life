import 'package:chat_life/index.dart';

class ChatLifeSplitViewLeftWidget extends StatefulWidget {
  const ChatLifeSplitViewLeftWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<ChatLifeSplitViewLeftWidget> createState() =>
      _ChatLifeSplitViewLeftWidgetState();
}

class _ChatLifeSplitViewLeftWidgetState
    extends State<ChatLifeSplitViewLeftWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final status = widget.user.status;

    return Scaffold(
      appBar: AppBar(
        leading: ChatLifeSideBarAvatarWidget(user: widget.user),
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
                  backgroundColor: status.isOnline ? Colors.green : Colors.red,
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
              boundaryBackground: BoundaryBackground(
                blurSigmaX: 4,
                blurSigmaY: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: colorScheme.outlineVariant.withAlpha(32),
                ),
              ),
              linearShapeParams: const LinearShapeParams(
                space: 4,
                angle: -90,
              ),
              centerOffset: const Offset(-40, 40),
              closeDurationMs: 200,
            ),
            items: [
              BaseChipWidget(
                label: '创建群聊',
                leadingIconData: Icons.add_comment_rounded,
                onTap: () {},
              ),
              BaseChipWidget(
                label: '加好友/群',
                leadingIconData: Icons.person_add_alt_1_outlined,
                onTap: () {},
              ),
            ],
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_rounded),
            ),
          )
        ],
      ),
      drawer: ChatLifeSplitViewLeftDrawerWidget(user: widget.user),
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
        onDestinationSelected: (value) =>
            setState(() => _selectedIndex = value),
      ),
    );
  }
}

class ChatLifeSideBarAvatarWidget extends StatelessWidget {
  const ChatLifeSideBarAvatarWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: BasedAvatar(
        image: NetworkImage(user.icon),
        onTap: Scaffold.of(context).openDrawer,
        onLongPress: () {
          splitViewKey.currentState!.push(ModalBottomSheetRoute(
            builder: (context) => ChatLifeBottomSheetWidget(
              user: user,
            ),
            isScrollControlled: true,
          ));
        },
      ),
    );
  }
}
