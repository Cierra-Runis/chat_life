import 'package:chat_life/index.dart';

import 'record_media.dart';

/// A class that represents bottom bar widget with a text field, attachment and
/// send buttons inside. By default hides send button when text field is empty.
class Input extends StatefulWidget {
  /// Creates [Input] widget.
  const Input({
    super.key,
    required this.textFieldFocusNode,
    required this.onSendPressed,
    required this.setSheetType,
    this.isAttachmentUploading,
    this.onAttachmentPressed,
    this.options = const InputOptions(),
  });

  /// Whether attachment is uploading. Will replace attachment button with a
  /// [CircularProgressIndicator]. Since we don't have libraries for
  /// managing media in dependencies we have no way of knowing if
  /// something is uploading so you need to set this manually.
  final bool? isAttachmentUploading;

  /// See [AttachmentButton.onPressed].
  final VoidCallback? onAttachmentPressed;

  final void Function(SheetType sheetType) setSheetType;

  /// Will be called on [SendButton] tap. Has [types.PartialText] which can
  /// be transformed to [types.TextMessage] and added to the messages list.
  final void Function(Message message) onSendPressed;

  /// Customization options for the [Input].
  final InputOptions options;

  final FocusNode textFieldFocusNode;

  @override
  State<Input> createState() => _InputState();
}

enum SelectEmojiType {
  /// Built-in
  builtIn(Icons.sentiment_very_satisfied_rounded),

  /// GIF uploaded by users
  favorite(Icons.favorite_outline_rounded),

  /// Sticker published by individual creator
  sticker(Icons.sticky_note_2_outlined);

  const SelectEmojiType(this.iconData);
  final IconData iconData;
}

/// [Input] widget state.
class _InputState extends State<Input> {
  Future<FilePickerResult?>? selectedFiles;
  final textController = TextEditingController();
  SelectEmojiType selectEmojiType = SelectEmojiType.builtIn;

  void setSelectedFiles(Future<FilePickerResult?> result) =>
      setState(() => selectedFiles = result);

  void handleSendPressed() {
    final trimmedText = textController.text.trim();

    if (trimmedText.isNotEmpty) {
      widget.onSendPressed(
        TextMessage(
          id: '',
          data: [
            PlainMessageData(text: trimmedText),
            UrlMessageData(url: trimmedText),
          ],
        ),
      );
      // _textController.clear();
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: AttachmentButton(
        textFieldFocusNode: widget.textFieldFocusNode,
        setSheetType: widget.setSheetType,
      ),
      title: TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        focusNode: widget.textFieldFocusNode,
        enabled: widget.options.enabled,
        autocorrect: widget.options.autocorrect,
        enableSuggestions: widget.options.enableSuggestions,
        controller: textController,
        cursorColor: colorScheme.primary,
        keyboardType: widget.options.keyboardType,
        maxLines: 5,
        minLines: 1,
        onChanged: widget.options.onTextChanged,
        onTap: widget.options.onTextFieldTap,
        textCapitalization: TextCapitalization.sentences,
      ),
      trailing: ValueListenableBuilder(
        valueListenable: textController,

        /// TODO: Fix animation
        builder: (context, value, child) => AnimatedSwitcher(
          duration: const Duration(microseconds: 500),
          child: Wrap(
            alignment: WrapAlignment.end,
            key: ValueKey(value.text.isEmpty),
            children: value.text.isEmpty
                ? [
                    IconButton(
                      icon: const Icon(Icons.sticky_note_2_outlined),
                      onPressed: () {},
                    ),
                    RecordMediaButton(
                      onRecord: (url) => widget.onSendPressed(
                        TextMessage(
                          id: '',
                          data: [UrlMessageData(url: url)],
                        ),
                      ),
                    ),
                  ]
                : [
                    IconButton(
                      onPressed: handleSendPressed,
                      icon: const Icon(Icons.send_rounded),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}

class AttachmentButton extends StatelessWidget with PickFiles {
  const AttachmentButton({
    super.key,
    required this.textFieldFocusNode,
    required this.setSheetType,
  });

  final FocusNode textFieldFocusNode;

  final void Function(SheetType sheetType) setSheetType;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        textFieldFocusNode.unfocus();
        Future.delayed(
          const Duration(milliseconds: 10),
          () => setSheetType(SheetType.large),
        );

        // final files = await pickFiles(context);
        // App.printLog('Picked files', inspect: files);
      },
      icon: const Icon(Icons.attach_file_rounded),
    );
  }
}

mixin class PickFiles {
  Future<FilePickerResult?> pickFiles(BuildContext context) {
    if (Platform.isAndroid || Platform.isWindows) {
      return showModalBottomSheet(
        context: context,
        builder: (context) => const AttachmentSheet(),
      );
    } else if (Platform.isWindows) {
      return FilePicker.platform.pickFiles();
    } else {
      throw UnimplementedError(
        'The current platform "${Platform.operatingSystem}" is not supported by this plugin.',
      );
    }
  }
}

class AttachmentSheet extends StatefulWidget {
  const AttachmentSheet({
    super.key,
  });

  @override
  State<AttachmentSheet> createState() => _AttachmentSheetState();
}

class _AttachmentSheetState extends State<AttachmentSheet>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              children: const [
                Card(
                  child: Text('111'),
                ),
                Card(
                  child: Text('222'),
                ),
                Card(
                  child: Text('333'),
                ),
              ],
            ),
          ),
          const Icon(Icons.abc),
        ],
      ),
    );
  }
}

@immutable
class InputOptions {
  const InputOptions({
    this.keyboardType = TextInputType.multiline,
    this.onTextChanged,
    this.onTextFieldTap,
    this.textEditingController,
    this.autocorrect = true,
    this.autofocus = false,
    this.enableSuggestions = true,
    this.enabled = true,
  });

  /// Controls the [Input] keyboard type. Defaults to [TextInputType.multiline].
  final TextInputType keyboardType;

  /// Will be called whenever the text inside [TextField] changes.
  final void Function(String)? onTextChanged;

  /// Will be called on [TextField] tap.
  final VoidCallback? onTextFieldTap;

  /// Custom [TextEditingController]. If not provided, defaults to the
  /// [InputTextFieldController], which extends [TextEditingController] and has
  /// additional fatures like markdown support. If you want to keep additional
  /// features but still need some methods from the default [TextEditingController],
  /// you can create your own [InputTextFieldController] (imported from this lib)
  /// and pass it here.
  final TextEditingController? textEditingController;

  /// Controls the [TextInput] autocorrect behavior. Defaults to [true].
  final bool autocorrect;

  /// Whether [TextInput] should have focus. Defaults to [false].
  final bool autofocus;

  /// Controls the [TextInput] enableSuggestions behavior. Defaults to [true].
  final bool enableSuggestions;

  /// Controls the [TextInput] enabled behavior. Defaults to [true].
  final bool enabled;
}
