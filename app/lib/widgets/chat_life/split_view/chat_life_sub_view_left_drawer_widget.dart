import 'package:chat_life/index.dart';

class ChatLifeSplitViewLeftDrawerWidget extends StatelessWidget {
  const ChatLifeSplitViewLeftDrawerWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Drawer(
          width: constraints.maxWidth,
          shape: const BeveledRectangleBorder(),
          child: Column(
            children: [
              BasedListTile(
                leading: BaseChipWidget(
                  label: '今天也是好天气',
                  leadingIconData: Icons.calendar_month_rounded,
                  onTap: () {}, // TODO:
                ),
                detail: const BaseDrawerCloseButtonWidget(),
                // TODO:
                // bottomView: Padding(
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 8.0,
                //     horizontal: 16.0,
                //   ),
                //   child: Row(
                //     children: [
                //       BasedAvatar(
                //         icon: user.icon,
                //         size: 50,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               user.name,
                //               style: const TextStyle(fontSize: 18),
                //             ),
                //             BaseChipWidget(
                //               label: user.motto,
                //               leadingIconData: Icons.edit_rounded,
                //               onTap: () {}, // TODO:
                //             )
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                onTap: () => context.push(
                  UserDetailPage(
                    user: user,
                    watch: user,
                  ),
                ),
              ),
              Expanded(
                child: BasedListView(
                  children: [
                    BasedListTile(
                      leadingIcon: Icons.settings_rounded,
                      titleText: '设置',
                      onTap: () => context.push(
                        const SettingPage(),
                      ),
                    ),
                    BasedListTile(
                      leadingIcon: Icons.info_rounded,
                      titleText: '关于 ${ChatLife.appName}',
                      onTap: () async {
                        final packageInfo = await PackageInfo.fromPlatform();
                        if (context.mounted) {
                          context.push(
                            AboutPage(
                              packageInfo: packageInfo,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BaseDrawerCloseButtonWidget extends StatelessWidget {
  const BaseDrawerCloseButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CloseButton(
      onPressed: Scaffold.of(context).closeDrawer,
    );
  }
}
