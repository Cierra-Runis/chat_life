import 'package:chat_life/index.dart';

class ChatPersonListItemWidget extends StatelessWidget {
  const ChatPersonListItemWidget({
    super.key,
    required this.user,
    required this.person,
  });

  final User user;
  final User person;

  @override
  Widget build(BuildContext context) {
    return BaseListItemWidget(
      icon: BaseAvatarWidget(
        icon: person.icon,
        isGrey: !person.status.isOnline,
      ),
      titleText: person.name,
      summaryText: '[${person.status.label}] ${person.motto}',
      onTap: () => chatAppGlobalKey.currentState?.push(
        BasePageRouteWidget(
          page: UserDetailPage(user: person),
        ),
      ),
    );
  }
}
