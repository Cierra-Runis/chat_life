import 'package:chat_life/index.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

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
            child: BaseListWidget(
              children: [
                Center(
                  child: Column(
                    children: [
                      const ChatLifeLogoWidget(),
                      Text(
                        ChatLife.appVersion,
                        style: TextStyle(color: colorScheme.outline),
                      ),
                    ],
                  ),
                ),
                BaseListSectionWidget(
                  children: [
                    BaseListItemWidget(
                      iconData: UniconsLine.github_alt,
                      titleText: '前往 Github 仓库',
                      summaryText: ChatLife.appGithub,
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
              onPressed: () => BaseSplitViewWidget.of(context).push(
                const LicensePage(
                  applicationVersion: ChatLife.appVersion,
                ),
              ),
              child: const Text('许可'),
            ),
          )
        ],
      ),
    );
  }
}
