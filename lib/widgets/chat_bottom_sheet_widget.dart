import 'package:chat_life/index.dart';

class ChatBottomSheetWidget extends StatelessWidget {
  const ChatBottomSheetWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () => Navigator.pop(context),
      builder: (context) => Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Center(
            child: Row(
              children: [
                AvatarWidget(icon: user.icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
