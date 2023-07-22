import 'package:chat_life/index.dart';

class DockBarWidget extends StatelessWidget {
  const DockBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double side = width / 2.8;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Divider(
          color: Theme.of(context).colorScheme.outline,
          thickness: 4,
          indent: side,
          endIndent: side,
        ),
      ),
    );
  }
}
