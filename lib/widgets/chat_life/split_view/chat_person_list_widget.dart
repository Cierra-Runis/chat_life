import 'package:chat_life/index.dart';

class ChatPersonListWidget extends StatelessWidget {
  const ChatPersonListWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return BaseListWidget(
      children: [
        for (final contactUser in user.contactUsers)
          ChatPersonListItemWidget(
            user: user,
            person: contactUser,
          )
      ],
    );
  }
}
