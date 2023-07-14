import 'package:chat_life/index.dart';

import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as type;

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    final double side = MediaQuery.of(context).size.width / 2.8;

    return Scaffold(
      appBar: StatusBarWidget(dateTime: dateTime),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Expanded(
                      child: MercuriusListWidget(
                        children: [
                          MercuriusListItemWidget(
                            showIconBadge: true,
                            iconData: Icons.people_alt_rounded,
                            titleText: '四人组',
                            summaryText: '你: 最新消息预览',
                            accessoryView: Text('7:48'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Chat(
                        key: UniqueKey(),
                        theme: dateTime.isDay
                            ? const DefaultChatTheme()
                            : const ChatLifeDarkChatTheme(),
                        messages: const [
                          type.TextMessage(
                            author: type.User(id: 'id'),
                            id: '',
                            text: 'aaa',
                          ),
                        ],
                        onSendPressed: (type.PartialText text) {},
                        user: const type.User(id: ''),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // TODO: fix it
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  thickness: 4,
                  indent: side,
                  endIndent: side,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
