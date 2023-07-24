import 'package:chat_life/index.dart';

class ChatLifeSplitViewWidget extends StatelessWidget {
  const ChatLifeSplitViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSplitViewWidget(
      navigatorKey: chatLifeNavigatorKey,
      pageBuilder: ({
        arguments,
        required child,
        fullscreenDialog,
        required key,
        restorationId,
        title,
      }) =>
          CupertinoPage<void>(
        title: title,
        arguments: arguments,
        key: key,
        restorationId: restorationId,
        child: child,
        fullscreenDialog: fullscreenDialog ?? false,
      ),
      leftWidget: ChatLifeSplitViewLeftWidget(
        user: User(
          id: 43967184365,
          icon: 'assets/images/chaos.jpg',
          name: 'chaos',
          motto: '存在。存在？',
          cover: 'assets/images/chaos_cover.jpg',
          likes: 4529,
          status: UserStatusType.online,
          contactUsers: [
            const User(
              id: 65715149826,
              icon: 'assets/images/orange.jpg',
              name: 'orange',
              motto: '',
              cover: '',
              likes: 12,
              status: UserStatusType.offline,
              userRooms: [],
              contactUsers: [],
              switchableUserIds: [],
            ),
          ],
          switchableUserIds: [
            54284364881,
          ],
          userRooms: [
            UserRoom(id: 0, dateTime: DateTime(2023, 01, 01, 18, 24)),
            UserRoom(id: 1, dateTime: DateTime(2023, 01, 01, 18, 29)),
          ],
        ),
      ),
      rightPlaceholder: const ChatLifeLogoWidget(),
    );
  }
}
