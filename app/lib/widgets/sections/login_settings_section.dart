import 'package:chat_life/index.dart';

class LoginSettingSection extends StatelessWidget {
  const LoginSettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BasedListSection(
      children: [
        NetworkDetectTile(),
        ProxySettingsTile(),
        CacheCleanTile(),
        NewReleaseTile(),
        AboutUsTile(),
      ],
    );
  }
}
