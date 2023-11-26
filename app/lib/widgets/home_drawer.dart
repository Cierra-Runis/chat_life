import 'package:chat_life/index.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setStore = ref.watch(storeProvider.notifier);

    return Drawer(
      width: double.maxFinite,
      shape: const RoundedRectangleBorder(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            flexibleSpace: const FlexibleSpaceBar(
              background: ChatLifeIcon(),
            ),
            stretch: true,
            leading: ActionChip(
              avatar: const Icon(Icons.event_available_rounded),
              onPressed: () {},
              label: const Text('打卡'),
            ),
            leadingWidth: 90,
            actions: [
              CloseButton(
                onPressed: Scaffold.of(context).closeDrawer,
              ),
            ],
          ),
          SliverList.list(
            children: [
              BasedListTile(
                leading: const BasedAvatar(),
                trailing: IconButton(
                  onPressed: () => context.push(const QRPage()),
                  icon: const Icon(Icons.qr_code_rounded),
                ),
              ),
              BasedListSection(
                elevation: 0,
                children: [
                  BasedListTile(
                    leadingIcon: Icons.settings_rounded,
                    titleText: '设置',
                    onTap: () => context.push(const SettingsPage()),
                  ),
                  BasedListTile(
                    leadingIcon: Icons.info_outline_rounded,
                    titleText: '关于',
                    onTap: () => context.push(const AboutPage()),
                  ),
                  BasedListTile(
                    leadingIcon: Icons.info_outline_rounded,
                    titleText: '退出登录',
                    onTap: () => setStore.setToken(null),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatLifeIcon extends StatelessWidget {
  const ChatLifeIcon({
    super.key,
    this.width = 128,
    this.color,
  });

  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/icon.svg',
      width: width,
      colorFilter: ColorFilter.mode(
        color ?? context.colorScheme.outline,
        BlendMode.srcIn,
      ),
    );
  }
}
