import 'package:chat_life/index.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.maxFinite,
      shape: const RoundedRectangleBorder(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/images/app_icon.ico'),
              ),
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
