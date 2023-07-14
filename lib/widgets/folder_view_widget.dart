import 'package:chat_life/index.dart';

class FolderViewWidget extends StatelessWidget {
  const FolderViewWidget({
    super.key,
    required this.folderName,
    this.streamBuilder,
  });

  final String folderName;
  final StreamBuilder? streamBuilder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Stack(
          children: [
            if (streamBuilder != null) streamBuilder!,
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(72.0),
                child: Text(
                  folderName,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
