import 'package:chat_life/index.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

// For the testing purposes, you should probably use https://pub.dev/packages/uuid.
String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [
    types.TextMessage(
      author: const types.User(
        id: '111111',
        imageUrl: 'https://avatars.githubusercontent.com/u/29329988',
      ),
      id: randomString(),
      text: 'text',
    ),
  ];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
    imageUrl: 'https://avatars.githubusercontent.com/u/29329988',
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final theme = DefaultChatTheme(
      errorColor: colorScheme.error,
      highlightMessageColor: colorScheme.background,
      primaryColor: context.brightness.isDark
          ? const Color(0x2E000000)
          : const Color(0xFFF2F2F2),
      secondaryColor: context.brightness.isDark
          ? const Color(0x2E000000)
          : const Color(0xFFF2F2F2),
      backgroundColor: colorScheme.background,
      inputSurfaceTintColor: colorScheme.surfaceTint,
      inputBackgroundColor: colorScheme.background,
      inputTextColor: colorScheme.onBackground,
      inputBorderRadius: BorderRadius.zero,
      inputContainerDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant,
            width: 0.5,
          ),
        ),
      ),
      messageBorderRadius: 12,
      messageInsetsHorizontal: 12,
      messageInsetsVertical: 6,
      userNameTextStyle: const TextStyle(fontSize: 12, height: 4 / 3),
      sentMessageBodyTextStyle: const TextStyle(fontSize: 14, height: 1.5),
      receivedMessageBodyTextStyle: const TextStyle(fontSize: 14, height: 1.5),
    );

    return Scaffold(
      body: Chat(
        showUserAvatars: true,
        showUserNames: true,
        avatarBuilder: (author) => BasedAvatar(
          image: NetworkImage(
            author.imageUrl ?? '',
          ),
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
        onSendPressed: _handleSendPressed,
        onAttachmentPressed: _handleImageSelection,
        user: _user,
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() => _messages.insert(0, message));
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
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
        height: image.height.toDouble(),
        id: randomString(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }
}
