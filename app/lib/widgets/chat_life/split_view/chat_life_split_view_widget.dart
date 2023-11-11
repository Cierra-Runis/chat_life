import 'package:chat_life/index.dart';

class ChatLifeSplitViewWidget extends StatelessWidget {
  const ChatLifeSplitViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasedSplitView(
      navigatorKey: splitViewKey,
      splitMode: SplitMode.width,
      leftWidget: const ChatLifeSplitViewLeftWidget(
        user: User(
          id: 43967184365,
          icon: 'assets/images/chaos.jpg',
          name: 'chaos',
          motto: '存在。存在？',
          cover: 'assets/images/chaos_cover.jpg',
          likes: 4529,
          status: UserStatusType.online,
          contactUsers: [
            User(
              id: 65715149826,
              icon: 'assets/images/orange.jpg',
              name: 'orange',
              motto: '',
              cover: '',
              likes: 12,
              status: UserStatusType.offline,
              userRoomIds: [],
              contactUsers: [],
              switchableUserIds: [],
            ),
          ],
          switchableUserIds: [
            54284364881,
          ],
          userRoomIds: [1],
        ),
      ),
      rightPlaceholder: const ChatLifeLogoWidget(),
    );
  }
}
