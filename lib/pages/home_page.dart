import 'package:chat_life/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.save,
    required this.dateTime,
  });

  final Save save;
  final DateTime dateTime;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = ChatUser(id: 'id', name: 'name');

  final _chatController = ChatController(
    initialMessageList: [
      Message(
        id: '1',
        message:
            'message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message ',
        createdAt: DateTime(2022),
        sendBy: 'i',
      ),
      Message(
        id: '2',
        message:
            'message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message ',
        reaction: Reaction(
          reactions: ['reactions'],
          reactedUserIds: ['id'],
        ),
        createdAt: DateTime.now(),
        sendBy: 'id',
      ),
      Message(
        id: '3',
        message:
            'message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message message ',
        createdAt: DateTime(2022),
        sendBy: 'i',
      ),
    ],
    scrollController: ScrollController(),
    chatUsers: [
      ChatUser(id: 'id', name: 'name'),
      ChatUser(id: 'i', name: 'na'),
    ],
  );

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
    final double width = MediaQuery.of(context).size.width;
    final double side = width / 2.8;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
      enableCurrentUserProfileAvatar: true,
      enableReplySnackBar: false,
    );

    final sendMessageConfiguration = SendMessageConfiguration(
      allowRecordingVoice: false,
      textFieldBackgroundColor: colorScheme.surfaceVariant,
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
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 72,
                ),
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

    return Scaffold(
      appBar: StatusBarWidget(
        dateTime: widget.dateTime,
        backgroundColor: colorScheme.surface,
      ),
      body: Stack(
        children: [
          ChatView(
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
            sendMessageConfig: sendMessageConfiguration,
          ),
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
