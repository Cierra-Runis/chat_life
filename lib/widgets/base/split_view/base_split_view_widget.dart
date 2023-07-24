import 'package:flutter/material.dart';
import 'index.dart';

class BaseSplitViewWidget extends StatefulWidget {
  const BaseSplitViewWidget({
    super.key,
    required this.pageBuilder,
    required this.navigatorKey,
    required this.leftWidget,
    this.rightPlaceholder = const BaseSplitViewPlaceholderWidget(),
  });

  /// 由于 [BaseSplitViewWidget] 本就是 [BaseAppWidget]
  ///
  /// 故传入 [navigatorKey] 控制这个 [BaseAppWidget] 的路由
  final GlobalKey<NavigatorState> navigatorKey;

  final BaseAppPageBuilder pageBuilder;

  /// 左边子组件
  final Widget leftWidget;

  /// 右边子组件占位符
  ///
  /// 为空时使用 [BaseSplitViewPlaceholderWidget]
  final Widget rightPlaceholder;

  static BaseSplitViewWidgetState of(BuildContext context) {
    final state = context.findAncestorStateOfType<BaseSplitViewWidgetState>();
    assert(state != null, 'No BaseSplitViewWidgetState found in the $context');
    return state!;
  }

  @override
  State<BaseSplitViewWidget> createState() => BaseSplitViewWidgetState();
}
