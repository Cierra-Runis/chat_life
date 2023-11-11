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
    return BasedListTile(
      leading: BasedAvatar(
        image: NetworkImage(person.icon),
        // isGrey: !person.status.isOnline,
      ),
      titleText: person.name,
      detailText: '[${person.status.label}] ${person.motto}',
      onTap: () => context.push(
        UserDetailPage(
          user: person,
          watch: user,
        ),
      ),
    );
  }
}
