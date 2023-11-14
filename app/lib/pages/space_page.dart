import 'package:chat_life/index.dart';

class SpacePage extends StatelessWidget {
  const SpacePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// TODO: better big screen adapt
    return const _SpacePage();
  }
}

class _SpacePage extends StatelessWidget {
  const _SpacePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('空间'),
        actions: [
          IconButton(
            onPressed: () => context.push(const SpaceNotificationPage()),
            icon: const Icon(Icons.notifications_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(
          const SpacePostCreatePage(),
        ),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

class SpaceNotificationPage extends StatelessWidget {
  const SpaceNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('空间通知'),
      ),
    );
  }
}

class SpacePostCreatePage extends StatefulWidget {
  const SpacePostCreatePage({super.key});

  @override
  State<SpacePostCreatePage> createState() => _SpacePostCreatePageState();
}

class _SpacePostCreatePageState extends State<SpacePostCreatePage> {
  final _quillController = QuillController(
    document: Document(),
    selection: const TextSelection.collapsed(offset: 0),
  );

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _quillController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: context.pop,
          child: const Text('取消'),
        ),
        title: const Text('写贴子'),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text(
                    jsonEncode(_quillController.document.toDelta().toJson()),
                  ),
                ),
              );
            },
            child: const Text('发布'),
          ),
        ],
      ),
      body: QuillProvider(
        configurations: QuillConfigurations(
          controller: _quillController,
        ),
        child: Column(
          children: [
            Expanded(
              child: _QuillEditor(
                scrollController: _scrollController,
              ),
            ),
            _QuillToolbar(controller: _quillController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        tooltip: '回到顶部',
        onPressed: () => _scrollController.animateTo(
          -ChatLifeAppBar.appBarHeight,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        ),
        child: const Icon(Icons.rocket_rounded),
      ),
    );
  }
}

class _QuillEditor extends StatelessWidget {
  const _QuillEditor({
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final baseStyle = TextStyle(
      color: context.colorScheme.onBackground,
      fontFamily: App.fontTorus,
      fontFamilyFallback: const [App.fontCascadiaCodePL, App.fontMiSans],
      height: 4 / 3,
    );

    const verticalSpacing = VerticalSpacing(4, 4);
    const lineSpacing = VerticalSpacing(0, 0);

    final h1 = DefaultTextBlockStyle(
      baseStyle.copyWith(fontSize: 20),
      verticalSpacing,
      lineSpacing,
      const BoxDecoration(),
    );

    final h2 = DefaultTextBlockStyle(
      baseStyle.copyWith(fontSize: 18),
      verticalSpacing,
      lineSpacing,
      const BoxDecoration(),
    );

    final h3 = DefaultTextBlockStyle(
      baseStyle.copyWith(fontSize: 16),
      verticalSpacing,
      lineSpacing,
      const BoxDecoration(),
    );

    final paragraph = DefaultTextBlockStyle(
      baseStyle,
      verticalSpacing,
      lineSpacing,
      const BoxDecoration(),
    );

    final bold = baseStyle.copyWith(
      fontWeight: FontWeight.bold,
    );
    final subscript = baseStyle.copyWith(
      fontFeatures: [const FontFeature.subscripts()],
    );
    final superscript = baseStyle.copyWith(
      fontFeatures: [const FontFeature.superscripts()],
    );
    final italic = baseStyle.copyWith(
      fontStyle: FontStyle.italic,
    );
    final small = baseStyle.copyWith(
      fontSize: 12,
    );
    final underline = baseStyle.copyWith(
      decoration: TextDecoration.underline,
    );
    final strikeThrough = baseStyle.copyWith(
      decoration: TextDecoration.lineThrough,
    );

    /// FIXME: backgroundColor no effect <https://github.com/singerdmx/flutter-quill/issues/1409>
    final inlineCode = InlineCodeStyle(
      style: baseStyle,
      backgroundColor: null,
      radius: const Radius.circular(120),
    );

    final link = small.copyWith(
      color: context.colorScheme.primary,
      fontFamily: App.fontCascadiaCodePL,
      decoration: TextDecoration.underline,
    );

    final placeholder = DefaultTextBlockStyle(
      baseStyle.copyWith(
        color: context.colorScheme.outline,
      ),
      verticalSpacing,
      lineSpacing,
      const BoxDecoration(),
    );

    final lists = DefaultListBlockStyle(
      small.copyWith(fontFamily: App.fontCascadiaCodePL),
      verticalSpacing,
      lineSpacing,
      const BoxDecoration(),
      null,
    );

    final quote = DefaultTextBlockStyle(
      placeholder.style,
      verticalSpacing,
      lineSpacing,
      BoxDecoration(
        border: Border(
          left: BorderSide(
            color: context.colorScheme.primary,
            width: 4,
          ),
        ),
      ),
    );

    final code = DefaultTextBlockStyle(
      small.copyWith(
        color: context.colorScheme.secondary,
        fontFamily: App.fontCascadiaCodePL,
      ),
      verticalSpacing,
      lineSpacing,
      BoxDecoration(
        color: context.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final indent = DefaultTextBlockStyle(
      baseStyle,
      verticalSpacing,
      lineSpacing,
      null,
    );

    final align = DefaultTextBlockStyle(
      baseStyle,
      verticalSpacing,
      lineSpacing,
      null,
    );

    final leading = DefaultTextBlockStyle(
      baseStyle,
      verticalSpacing,
      lineSpacing,
      null,
    );

    final sizeSmall = baseStyle.copyWith(fontSize: 10);
    final sizeLarge = baseStyle.copyWith(fontSize: 16);
    final sizeHuge = baseStyle.copyWith(fontSize: 18);

    return QuillEditor(
      configurations: QuillEditorConfigurations(
        padding: const EdgeInsets.all(8.0),
        autoFocus: true,
        expands: true,
        placeholder: '写点啥好呢～？',
        keyboardAppearance: context.brightness,
        customStyles: DefaultStyles(
          h1: h1,
          h2: h2,
          h3: h3,
          paragraph: paragraph,
          bold: bold,
          subscript: subscript,
          superscript: superscript,
          italic: italic,
          small: small,
          underline: underline,
          strikeThrough: strikeThrough,
          inlineCode: inlineCode,
          link: link,
          placeHolder: placeholder,
          lists: lists,
          quote: quote,
          code: code,
          indent: indent,
          align: align,
          leading: leading,
          sizeSmall: sizeSmall,
          sizeLarge: sizeLarge,
          sizeHuge: sizeHuge,
        ),
      ),
      focusNode: FocusNode(),
      scrollController: scrollController,
    );
  }
}

class _QuillToolbar extends StatelessWidget {
  const _QuillToolbar({
    required this.controller,
  });

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return QuillToolbar(
      configurations: QuillToolbarConfigurations(
        buttonOptions: QuillToolbarButtonOptions(
          base: QuillToolbarBaseButtonOptions(
            controller: controller,
            iconTheme: QuillIconTheme(
              iconSelectedColor: context.colorScheme.onPrimaryContainer,
              borderRadius: 12,
            ),
          ),
        ),
        showAlignmentButtons: true,
        showBackgroundColorButton: false,
        showClearFormat: false,
        showColorButton: false,
        showDividers: false,
        showFontFamily: false,
        showFontSize: false,
        showIndent: false,

        /// FIXME: backgroundColor no effect <https://github.com/singerdmx/flutter-quill/issues/1409>
        showInlineCode: false,
        showLink: false,
        showRedo: false,
        showSearchButton: false,
        showSubscript: false,
        showSuperscript: false,
        showUndo: false,
      ),
    );
  }
}
