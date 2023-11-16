import 'package:chat_life/index.dart';
// import 'package:flutter/foundation.dart';

class ChatPage extends StatelessWidget /*with ChatMessageHandles*/ {
  const ChatPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return const ScaffoldMessenger(
    // child: _Scaffold(),
    // );
  }
}

// class _Scaffold extends StatefulWidget {
  // const _Scaffold();

  // @override
  // State<_Scaffold> createState() => _ScaffoldState();
// }

// class _ScaffoldState extends State<_Scaffold>
    // with ChatMessageHandles, ChatThemeMixin {
  // late WebSocketChannel channel;

  // final _messages = <types.Message>[
  //   types.TextMessage(
  //     author: const types.User(
  //       id: '111111',
  //       imageUrl: App.authorGitHubAvatar,
  //     ),
  //     id: randomString(),
  //     text: 'text',
  //     createdAt: 0,
  //   ),
  // ];

  // static const _user = types.User(
  //   id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  //   imageUrl: App.authorGitHubAvatar,
  // );

  // @override
  // void initState() {
    // super.initState();
    // channel = WebSocketChannel.connect(
    //   Uri.parse('ws://localhost:8080/ws'),
    // );
    // channel.stream.listen(
    //   (event) {
    //     _addMessage(
    //       types.Message.fromJson(jsonDecode(event)),
    //     );
    //   },
    //   onError: (e) => ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Connect Error: $e')),
    //   ),
    // );
  // }

  // @override
  // void dispose() {
    // channel.sink.close();
    // super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
    // return const Placeholder();
  // }

  // void onSendPressed(types.PartialText message) {
  //   final textMessage = types.TextMessage(
  //     author: _user,
  //     createdAt: DateTime.now().millisecondsSinceEpoch,
  //     id: randomString(),
  //     text: message.text.replaceAll('\r\n', '\n'),
  //   );

  //   _addMessage(textMessage);
  //   channel.sink.add(jsonEncode(textMessage.toJson()));
  // }

  // void _addMessage(types.Message message) {
  //   setState(() {
  //     _messages.insert(0, message);
  //   });
  // }

  // void _handleAttachmentPressed() {
  //   showDialog<void>(
  //     context: context,
  //     useRootNavigator: false,
  //     builder: (BuildContext context) => AlertDialog(
  //       title: const Text('选择附件种类'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text('取消'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             _handleImageSelection();
  //           },
  //           child: const Text('图片'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             _handleFileSelection();
  //           },
  //           child: const Text('文件'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _handleFileSelection() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.any,
  //   );

  //   if (result != null && result.files.single.path != null) {
  //     final message = types.FileMessage(
  //       author: _user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       id: randomString(),
  //       name: result.files.single.name,
  //       size: result.files.single.size,
  //       uri: result.files.single.path!,
  //     );

  //     _addMessage(message);
  //   }
  // }

  // void _handleImageSelection() async {
  //   final result = await ImagePicker().pickImage(
  //     imageQuality: 70,
  //     maxWidth: 1440,
  //     source: ImageSource.gallery,
  //   );

  //   if (result != null) {
  //     final bytes = await result.readAsBytes();
  //     final image = await decodeImageFromList(bytes);

  //     final message = types.ImageMessage(
  //       author: _user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       width: image.width.toDouble(),
  //       height: image.height.toDouble(),
  //       id: randomString(),
  //       name: result.name,
  //       size: bytes.length,
  //       uri: result.path,
  //     );

  //     _addMessage(message);
  //     channel.sink.add(jsonEncode(message.toJson()));
  //   }
  // }

  // void _handlePreviewDataFetched(
  //   types.TextMessage message,
  //   types.PreviewData previewData,
  // ) {
  //   final index = _messages.indexWhere((element) => element.id == message.id);
  //   final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
  //     previewData: previewData,
  //   );

  //   setState(() {
  //     _messages[index] = updatedMessage;
  //   });
  // }
// }

// class ChatPageBody extends StatelessWidget with ChatThemeMixin {
  // const ChatPageBody({
    // super.key,
    // required this.user,
    // required this.messages,
    // required this.onSendPressed,
    // this.onAttachmentPressed,
    // this.onPreviewDataFetched,
  // });

  // final types.User user;
  // final List<types.Message> messages;
  // final void Function(types.PartialText) onSendPressed;
  // final VoidCallback? onAttachmentPressed;
  // final void Function(types.TextMessage, types.PreviewData)?
  //     onPreviewDataFetched;

  // @override
  // Widget build(BuildContext context) {
    // final theme = getChatTheme(context);

    // return const Placeholder();

    // return Chat(
    //   /// TODO: find a better way to implement l10n
    //   l10n: const ChatL10nZhCN(),
    //   showUserAvatars: true,
    //   showUserNames: true,
    //   avatarBuilder: (author) => BasedAvatar(
    //     image: author.imageUrl != null
    //         ? NetworkImage(
    //             author.imageUrl!,
    //           )
    //         : null,
    //   ),
    //   nameBuilder: (p0) => Text(
    //     '${p0.firstName}',
    //     style: theme.userNameTextStyle,
    //   ),
    //   // customBottomWidget: const SizedBox(),
    //   emptyState: const Center(
    //     child: Text('要说些什么呢～？'),
    //   ),
    //   theme: theme,
    //   messages: messages,
    //   disableImageGallery: true,
    //   onSendPressed: onSendPressed,
    //   onAttachmentPressed: onAttachmentPressed,
    //   onPreviewDataFetched: onPreviewDataFetched,
    //   user: user,
    // );
  // }
// }

// mixin ChatMessageHandles on Diagnosticable {
  // void onMessageTap(BuildContext context, types.Message message) async {
  //   if (message is types.FileMessage) {
  //     final result = await OpenFilex.open(message.uri);
  //     if (result.type != ResultType.done && context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('暂不支持打开该文件'),
  //         ),
  //       );
  //     }
  //   }
  //   if (message is types.ImageMessage && context.mounted) {
  //     await context.push(
  //       Scaffold(
  //         appBar: AppBar(
  //           title: const Text('图片预览'),
  //         ),
  //         body: Center(
  //           child: Placeholder(
  //             child: Text(message.uri),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }
// }

// class ChatPageInput extends StatelessWidget with ChatMessageHandles {
  // const ChatPageInput({
    // super.key,
    // required this.onSendPressed,
  // });

  // final void Function(types.PartialText) onSendPressed;

  // @override
  // Widget build(BuildContext context) {
    // return Input(
    //   // onSendPressed: onSendPressed,
    // );
    // return const Placeholder();
  // }
// }
