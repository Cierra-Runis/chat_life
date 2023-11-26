import 'package:chat_life/index.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return const ScaffoldMessenger(
      child: Scaffold(),
    );
  }
}
