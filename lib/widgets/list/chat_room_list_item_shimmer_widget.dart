import 'package:chat_life/index.dart';

class ChatRoomListItemShimmerWidget extends StatelessWidget {
  const ChatRoomListItemShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BaseListItemWidget(
      icon: BaseFadeShimmerWidget.round(size: 40),
      title: BaseFadeShimmerWidget(width: 60, height: 14, radius: 7),
      summary: BaseFadeShimmerWidget(width: 180, height: 14, radius: 7),
      accessoryView: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 2,
        children: [
          BaseFadeShimmerWidget(width: 20, height: 10, radius: 5),
          BaseFadeShimmerWidget.round(size: 10)
        ],
      ),
    );
  }
}
