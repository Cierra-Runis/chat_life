import 'package:chat_life/index.dart';

class ChatRoomListItemShimmerWidget extends StatelessWidget {
  const ChatRoomListItemShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => BasedListTile(
        leading: const BaseFadeShimmerWidget.round(size: 40),
        // TODO:
        // title: BaseFadeShimmerWidget(
        //   width: constraints.maxWidth / 5,
        //   height: 14,
        //   radius: 7,
        // ),
        detail: BaseFadeShimmerWidget(
          width: constraints.maxWidth / 2,
          height: 14,
          radius: 7,
        ),
        trailing: const Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 2,
          children: [
            BaseFadeShimmerWidget(width: 20, height: 10, radius: 5),
            BaseFadeShimmerWidget.round(size: 10)
          ],
        ),
      ),
    );
  }
}
