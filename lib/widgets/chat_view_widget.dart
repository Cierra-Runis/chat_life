import 'package:chat_life/index.dart';

class ChatViewWidget extends StatelessWidget {
  const ChatViewWidget({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
        ),
        title: Text(room.title),
        centerTitle: true,
        actions: [
          EndDrawerButton(
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => ChatViewSettingWidget(room: room),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: room.messages.length + room.unreadMessages.length,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(
            [...room.messages, ...room.unreadMessages][index],
          ),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async => false,
          child: MercuriusListItemWidget(
            disabled: true,
            titleText: [...room.messages, ...room.unreadMessages][index],
          ),
        ),
      ),
    );
  }
}
