import 'package:chat_life/index.dart';

class DockBarWidget extends StatefulWidget {
  const DockBarWidget({
    super.key,
  });

  @override
  State<DockBarWidget> createState() => _DockBarWidgetState();
}

class _DockBarWidgetState extends State<DockBarWidget> {
  double top = 32;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double side = width / 2.8;

    ChatLife.printLog(top);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: (details) {
              setState(() {
                top += details.delta.dy;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Theme.of(context).colorScheme.outline,
                thickness: 4,
                indent: side,
                endIndent: side,
              ),
            ),
          ),
          Positioned(
            top: top,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.red,
              height: 30,
            ),
          )
        ],
      ),
    );
  }
}
