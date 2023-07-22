import 'package:chat_life/index.dart';

class ChatDrawerWidget extends StatelessWidget {
  const ChatDrawerWidget({
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
          MercuriusListItemWidget(
            icon: ChatChipWidget(
              iconData: Icons.calendar_month_rounded,
              label: '今天也是好天气',
              onPressed: () {}, // TODO:
            ),
            accessoryView: const CloseButton(),
            bottomView: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  AvatarWidget(
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
                        ChatChipWidget(
                          iconData: Icons.edit_rounded,
                          label: user.motto,
                          onPressed: () {}, // TODO:
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MercuriusListWidget(
              children: [
                MercuriusListItemWidget(
                  iconData: Icons.settings_rounded,
                  titleText: '设置',
                  onTap: () {}, // TODO:
                ),
                MercuriusListItemWidget(
                  iconData: Icons.info_rounded,
                  titleText: '关于 ${ChatLife.appName}',
                  onTap: () => Navigator.push(
                    chatAppGlobalKey.currentContext!,
                    ChatLifePageRouteWidget(page: const AboutPage()),
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
