import 'package:chat_life/index.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          actions: const [EndDrawerButton()],
        ),
        endDrawer: const Drawer(),
        body: const _ChatPage(),
      ),
    );
  }
}

class _ChatPage extends StatefulWidget {
  const _ChatPage();

  @override
  State<_ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<_ChatPage>
    with _ChatMessageHandles, _ChatTheme {
  late WebSocketChannel channel;

  final List<types.Message> _messages = [
    types.TextMessage(
      author: const types.User(
        id: '111111',
        imageUrl: App.authorGitHubAvatar,
      ),
      id: randomString(),
      text: 'text',
      createdAt: 0,
    ),
  ];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
    imageUrl: App.authorGitHubAvatar,
  );

  @override
  void initState() {
    super.initState();
    //创建websocket连接
    channel = WebSocketChannel.connect(Uri.parse('ws://localhost:8080/ws'));
    channel.stream.listen((event) {
      _addMessage(types.Message.fromJson(jsonDecode(event)));
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = getChatTheme(context);

    return Chat(
      /// TODO: find a better way to implement l10n
      l10n: const ChatL10nZhCN(),
      showUserAvatars: true,
      showUserNames: true,
      avatarBuilder: (author) => BasedAvatar(
        image: author.imageUrl != null
            ? NetworkImage(
                author.imageUrl!,
              )
            : null,
      ),
      nameBuilder: (p0) => Text(
        '${p0.firstName}',
        style: theme.userNameTextStyle,
      ),
      emptyState: const Center(
        child: Text('要说些什么呢～？'),
      ),
      theme: theme,
      messages: _messages,
      disableImageGallery: true,
      onSendPressed: _handleSendPressed,
      onAttachmentPressed: _handleAttachmentPressed,
      onPreviewDataFetched: _handlePreviewDataFetched,
      user: _user,
      onMessageTap: _handleMessageTap,
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text.replaceAll('\r\n', '\n'),
    );

    _addMessage(textMessage);
    channel.sink.add(jsonEncode(textMessage.toJson()));
  }

  void _handleAttachmentPressed() {
    showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('选择附件种类'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _handleImageSelection();
            },
            child: const Text('图片'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _handleFileSelection();
            },
            child: const Text('文件'),
          ),
        ],
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: randomString(),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        width: image.width.toDouble(),
        height: image.height.toDouble(),
        id: randomString(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
      );

      _addMessage(message);
      channel.sink.add(jsonEncode(message.toJson()));
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }
}

mixin _ChatMessageHandles on State<_ChatPage> {
  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      final result = await OpenFilex.open(message.uri);
      if (result.type != ResultType.done && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('暂不支持打开该文件'),
          ),
        );
      }
    }
    if (message is types.ImageMessage && mounted) {
      await context.push(
        Scaffold(
          appBar: AppBar(
            title: const Text('图片预览'),
          ),
          body: Center(
            child: Placeholder(
              child: Text(message.uri),
            ),
          ),
        ),
      );
    }
  }
}

mixin _ChatTheme on Object {
  DefaultChatTheme getChatTheme(BuildContext context) {
    final colorScheme = context.colorScheme;

    const bodyTextStyle = TextStyle(
      fontSize: 14,
      height: 1.5,
    );

    final linkDescriptionTextStyle = TextStyle(
      fontSize: 12,
      color: colorScheme.onBackground,
    );
    final linkTitleTextStyle = TextStyle(
      fontSize: 16,
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    final bodyLinkTextStyle = TextStyle(
      color: colorScheme.primary,
      decorationColor: colorScheme.primary,
      decoration: TextDecoration.underline,
    );

    const userTextStyle = TextStyle(fontSize: 12, height: 4 / 3);

    return DefaultChatTheme(
      /// colors
      errorColor: colorScheme.error,
      highlightMessageColor: colorScheme.background,
      primaryColor: context.brightness.isDark
          ? const Color(0x2E000000)
          : const Color(0xFFF2F2F2),
      secondaryColor: context.brightness.isDark
          ? const Color(0x2E000000)
          : const Color(0xFFF2F2F2),
      backgroundColor: colorScheme.background,

      /// input layout
      inputElevation: 3,
      inputSurfaceTintColor: colorScheme.surfaceTint,
      inputBackgroundColor: colorScheme.background,
      inputTextColor: colorScheme.onBackground,
      inputTextStyle: bodyTextStyle,
      inputBorderRadius: BorderRadius.zero,
      inputContainerDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
      ),

      /// message layout
      messageBorderRadius: 12,
      messageInsetsHorizontal: 12,
      messageInsetsVertical: 6,

      /// user textStyle
      userNameTextStyle: userTextStyle,
      userAvatarTextStyle: userTextStyle,

      /// sent message textStyle
      sentMessageBodyTextStyle: bodyTextStyle,
      sentMessageBodyLinkTextStyle: bodyLinkTextStyle,
      sentMessageLinkTitleTextStyle: linkTitleTextStyle,
      sentMessageLinkDescriptionTextStyle: linkDescriptionTextStyle,

      /// received message textStyle
      receivedMessageBodyTextStyle: bodyTextStyle,
      receivedMessageBodyLinkTextStyle: bodyLinkTextStyle,
      receivedMessageLinkTitleTextStyle: linkTitleTextStyle,
      receivedMessageLinkDescriptionTextStyle: linkDescriptionTextStyle,
    );
  }
}
