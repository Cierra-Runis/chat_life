import 'package:chat_life/index.dart';

class ProxySettingsTile extends StatelessWidget {
  const ProxySettingsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasedListTile(
      leadingIcon: Icons.vpn_lock_rounded,
      titleText: '代理设置',
      onTap: () => context.push(const ProxySettingsPage()),
    );
  }
}
