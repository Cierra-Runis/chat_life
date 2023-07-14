import 'package:chat_life/index.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final double side = MediaQuery.of(context).size.width / 2.8;
    final BorderRadius borderRadius = BorderRadius.circular(48.0);

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: side,
          height: side,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.4),
            borderRadius: borderRadius,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(18.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.04,
            ),
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }
}
