import 'package:chat_life/index.dart';

class ChatLifeSideBarDrawerWidget extends StatelessWidget {
  const ChatLifeSideBarDrawerWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      shape: const BeveledRectangleBorder(),
      child: Column(
        children: [
          BaseListItemWidget(
            icon: BaseChipWidget(
              label: '今天也是好天气',
              leadingIconData: Icons.calendar_month_rounded,
              onTap: () {}, // TODO:
            ),
            accessoryView: const CloseButton(),
            bottomView: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  BaseAvatarWidget(
                    icon: user.icon,
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        BaseChipWidget(
                          label: user.motto,
                          leadingIconData: Icons.edit_rounded,
                          onTap: () {}, // TODO:
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: () => chatLifeSubAppGlobalKey.pushBase(
              UserDetailPage(user: user),
            ),
          ),
          Expanded(
            child: BaseListWidget(
              children: [
                BaseListItemWidget(
                  iconData: Icons.settings_rounded,
                  titleText: '设置',
                  onTap: () => chatLifeSubAppGlobalKey.pushBase(
                    const SettingPage(),
                  ),
                ),
                BaseListItemWidget(
                  iconData: Icons.info_rounded,
                  titleText: '关于 ${ChatLife.appName}',
                  onTap: () => chatLifeSubAppGlobalKey.pushBase(
                    const AboutPage(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
