import 'package:chat_life/index.dart';

class AboutUsTile extends StatelessWidget {
  const AboutUsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BasedListTile(
      leadingIcon: Icons.info_outline_rounded,
      titleText: '关于我们',
      // onTap: () => context.push(const AboutUsPage()),
    );
  }
}
