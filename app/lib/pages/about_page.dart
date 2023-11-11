import 'package:chat_life/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
    required this.packageInfo,
  });

  final PackageInfo packageInfo;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于 ${ChatLife.appName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BasedListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      const ChatLifeLogoWidget(),
                      Text(
                        'v${packageInfo.version}+${packageInfo.buildNumber}',
                        style: TextStyle(color: colorScheme.outline),
                      ),
                    ],
                  ),
                ),
                BasedListSection(
                  children: [
                    BasedListTile(
                      leadingIcon: UniconsLine.github_alt,
                      titleText: '前往 Github 仓库',
                      detailText: ChatLife.appGithub,
                      onTap: () => launchUrlString(
                        ChatLife.appGithub,
                        mode: LaunchMode.externalApplication,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: TextButton(
              onPressed: () {
                if (context.mounted) {
                  context.push(
                    LicensePage(
                      applicationVersion:
                          'v${packageInfo.version}+${packageInfo.buildNumber}',
                      applicationIcon: const ChatLifeLogoWidget(),
                    ),
                  );
                }
              },
              child: const Text('许可'),
            ),
          )
        ],
      ),
    );
  }
}
