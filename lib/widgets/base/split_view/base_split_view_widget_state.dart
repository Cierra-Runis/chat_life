import 'package:flutter/material.dart';
import 'index.dart';

final GlobalKey _globalKey = GlobalKey();

class BaseSplitViewWidgetState extends State<BaseSplitViewWidget> {
  final List<BaseAppPageConfig> _configs = [];

  /// Number of pages in the stack.
  int get pageCount => _configs.length;

  List<Page> _pages = [];

  bool _split = false;

  bool get split => _split;

  @override
  void initState() {
    super.initState();
    _configs.add(BaseAppPageConfig(child: widget.leftWidget));
    _updatePages();
  }

  void _updatePages() {
    final pages = <Page>[];
    for (var i = 0; i < _configs.length; i++) {
      final pageConfig = _configs[i];
      final pageKey = ValueKey(i);
      final page = widget.pageBuilder(
        key: pageKey,
        child: pageConfig.child,
        title: pageConfig.name,
        arguments: pageConfig.arguments,
        restorationId: pageConfig.restorationId,
      );
      pages.add(page);
    }
    _pages = pages;
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (_configs.length <= 1) {
      return false;
    }
    if (route.didPop(result)) {
      _configs.removeLast();
      _updatePages();
      return true;
    }
    return false;
  }

  void setSecondary(
    Widget page, {
    String? title,
    Object? arguments,
    String? restorationId,
    bool? fullscreenDialog,
  }) {
    _configs.removeRange(1, _configs.length);

    _configs.add(
      BaseAppPageConfig(
        child: page,
        name: title,
        arguments: arguments,
        restorationId: restorationId,
        fullscreenDialog: fullscreenDialog,
      ),
    );

    setState(_updatePages);
  }

  void push(
    Widget page, {
    String? title,
    Object? arguments,
    String? restorationId,
    bool? fullscreenDialog,
  }) {
    final pageConfig = BaseAppPageConfig(
      child: page,
      name: title,
      arguments: arguments,
      restorationId: restorationId,
      fullscreenDialog: fullscreenDialog,
    );

    _configs.add(pageConfig);

    setState(_updatePages);
  }

  void pop() {
    if (_configs.length == 1) {
      return;
    }
    _configs.removeLast();
    setState(_updatePages);
  }

  void replace({
    required int index,
    required Widget page,
    String? title,
    Object? arguments,
    String? restorationId,
    bool? fullscreenDialog,
  }) {
    _configs[index] = BaseAppPageConfig(
      child: page,
      name: title,
      arguments: arguments,
      restorationId: restorationId,
      fullscreenDialog: fullscreenDialog,
    );

    setState(_updatePages);
  }

  /// Pops the pages until the [index]-th is reached.
  void popUntil(int index) {
    if (index < 0 || index >= pageCount) {
      throw ArgumentError('Index $index is out of bounds');
    }

    while (pageCount - 1 > index) {
      _configs.removeLast();
      setState(_updatePages);
    }
  }

  Future<T?> popupModalBottomSheet<T>(Widget sheet) async =>
      showModalBottomSheet(
        context: widget.navigatorKey.currentContext!,
        builder: (context) => sheet,
      );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BaseAppWidget(
      navigatorKey: widget.navigatorKey,
      colorScheme: colorScheme,
      home: LayoutBuilder(
        builder: (context, constraints) {
          final ratio = constraints.maxWidth / constraints.maxHeight;
          _split = ratio <= 0.9;

          if (_split) {
            return Navigator(
              key: _globalKey,
              pages: _pages,
              onPopPage: _onPopPage,
            );
          }

          final placeholder = Material(
            child: Center(child: widget.rightPlaceholder),
          );

          final right = pageCount == 1
              ? placeholder
              : Navigator(
                  pages: [
                    MaterialPage(child: placeholder),
                    ..._pages.sublist(1)
                  ],
                  onPopPage: _onPopPage,
                );

          return Row(
            children: [
              SizedBox(
                width: 1280 / 4,
                child: Navigator(
                  key: _globalKey,
                  pages: [_pages.first],
                  onPopPage: _onPopPage,
                ),
              ),
              Expanded(child: right),
            ],
          );
        },
      ),
    );
  }
}
