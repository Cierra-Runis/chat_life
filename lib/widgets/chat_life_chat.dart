import 'dart:math';

import 'package:chat_life/common/chat_life_user.dart';
import 'package:chat_life/index.dart';

class ChatLifeChat extends StatefulWidget {
  const ChatLifeChat({
    super.key,
    required this.save,
  });

  final Save save;

  @override
  State<ChatLifeChat> createState() => _ChatLifeChatState();
}

class _ChatLifeChatState extends State<ChatLifeChat> {
  late final ChatUser currentUser;
  late final List<Message> messages;
  late final ChatController _chatController;
  late final Stream<Message> stream;

  static List<ChatUser> chatUsers = [
    ChatLifeUser.mercury,
    ChatLifeUser.noRi,
  ];

  @override
  void initState() {
    super.initState();
    currentUser = widget.save.currentUser;
    messages = widget.save.messages;
    _chatController = ChatController(
      initialMessageList: messages,
      scrollController: ScrollController(),
      chatUsers: chatUsers,
    );
    stream = Stream.periodic(const Duration(seconds: 1), (_) {
      int number = Random.secure().nextInt(255);
      ChatLife.printLog(number);
      final message = Message(
        message: number.toString(),
        createdAt: DateTime.now(),
        sendBy: chatUsers[number ~/ chatUsers.length].id,
      );
      _chatController.addMessage(message);
      return message;
    });
  }

  void _onSendTap(
    String message,
    ReplyMessage replyMessage,
    MessageType messageType,
  ) {
    _chatController.addMessage(
      Message(
        id: '1',
        createdAt: DateTime.now(),
        message: message,
        sendBy: currentUser.id,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      _chatController.initialMessageList.last.setStatus =
          MessageStatus.undelivered;
    });
    Future.delayed(const Duration(seconds: 1), () {
      _chatController.initialMessageList.last.setStatus = MessageStatus.read;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double width = MediaQuery.of(context).size.width;

    final chatBubbleConfiguration = ChatBubbleConfiguration(
      maxWidth: width / 1.7,
      inComingChatBubbleConfig: ChatBubble(
        color: colorScheme.primaryContainer,
      ),
      outgoingChatBubbleConfig: ChatBubble(
        color: colorScheme.primary,
      ),
    );

    final chatBackgroundConfiguration = ChatBackgroundConfiguration(
      backgroundColor: colorScheme.background,
    );

    const featureActiveConfig = FeatureActiveConfig(
      enableSwipeToReply: false,
      enableSwipeToSeeTime: false,
      enableReactionPopup: false,
      enableReplySnackBar: false,
      enableTextField: false,
    );

    final profileCircleConfiguration = ProfileCircleConfiguration(
      onAvatarTap: (p0) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Wrap(
            spacing: 16,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(72 / 2),
                child: p0.profilePhoto != null
                    ? Image.network(
                        p0.profilePhoto!,
                        width: 72,
                      )
                    : null,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p0.name),
                  Text(
                    'ID: ${p0.id}',
                    style: TextStyle(
                      color: colorScheme.outline,
                      fontSize: 16,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      circleRadius: 24,
    );

    final messageConfiguration = MessageConfiguration(
      messageReactionConfig: MessageReactionConfiguration(
        reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
          profileCircleRadius: 28,
          reactionWidgetPadding: const EdgeInsets.only(right: 16.0),
          bottomSheetPadding: const EdgeInsets.all(28.0),
          reactionWidgetDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        backgroundColor: colorScheme.surfaceVariant.withOpacity(0.75),
        borderColor: colorScheme.outlineVariant,
      ),
    );

    return Column(
      children: [
        Expanded(
          child: ChatView(
            appBar: AppBar(
              title: const Column(
                children: [
                  Text('Hi?', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Available', style: TextStyle(fontSize: 12)),
                ],
              ),
              centerTitle: true,
            ),
            chatBubbleConfig: chatBubbleConfiguration,
            chatBackgroundConfig: chatBackgroundConfiguration,
            chatController: _chatController,
            chatViewState: ChatViewState.hasMessages,
            chatViewStateConfig: const ChatViewStateConfiguration(),
            currentUser: currentUser,
            featureActiveConfig: featureActiveConfig,
            messageConfig: messageConfiguration,
            onSendTap: _onSendTap,
            profileCircleConfig: profileCircleConfiguration,
          ),
        ),
        StreamBuilder<Message>(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!.id == currentUser.id) {
              return Container(
                width: double.maxFinite,
                color: colorScheme.surfaceVariant,
                padding: const EdgeInsets.fromLTRB(48, 12, 48, 24),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(snapshot.data!.message),
                  ],
                  onFinished: () {},
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
