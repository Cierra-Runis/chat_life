import 'package:chat_life/index.dart';

class ChatLifeBottomSheetWidget extends StatelessWidget {
  const ChatLifeBottomSheetWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () => Navigator.pop(context),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: Row(
            children: [
              BasedAvatar(
                image: NetworkImage(user.icon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
