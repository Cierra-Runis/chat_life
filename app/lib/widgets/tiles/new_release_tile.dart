import 'package:chat_life/index.dart';

class NewReleaseTile extends StatelessWidget {
  const NewReleaseTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasedListTile(
      leadingIcon: Icons.new_releases_rounded,
      titleText: '检查更新',
      onTap: () {},
    );
  }
}
